+++
title = 'DLC to YOLO'
date = 2025-07-30T10:00:00+12:00
draft = false
tags = ["CV", "YOLO", "DLC"]
description = "Converting DLC annotation format to YOLO Pose training format."
+++
We use DLC (DeepLabCut) to label keypoint data and train the model using YOLO Pose. Since the data format required by YOLO Pose is different from DLC's output, we need to convert it.  
With the help of AI today, it's quite easy to generate code for format conversion. Here's how we approached it:  
1. Interacted with AI to understand the differences between the DLC format and the YOLO format
2. Defined the desired format for YOLO training data
3. Asked AI to generate the conversion code based on the required format

We found that: 
1. **Clearly describing our requirements produced better results than directly using existing third-party libraries（deeplabcut2yolo）.**
2. Claude performed much better than GPT-o3 during the execution phase. We used GPT-o3 for clarifying concepts and Claude Sonnet 4 for generating the actual code.

# 1  Dataset declaration (YOLO-Pose)
cow9.yml example : 
```yaml
# Dataset root directory (absolute or relative)
path: /path/to/cowpose            

# Image subsets (relative to `path`)
train: images/train       # ~80 % of images for training
val:   images/val         # ~20 % of images for validation

# Keypoint shape: [<num_keypoints>, <coords_per_point>]
# 9  → the model expects **nine** anatomical points per cow
# 3  → each point supplies (x, y, visibility)
kpt_shape: [9, 3]         

# Number of object classes
nc: 1
names: {0: cow}

# Optional: name each keypoint for easier debugging/visualisation
keypoints:
  - Nose
  - Poll
  - Withers
  - MidThoracic
  - Sacrum
  - TailBase
  - LF_Knee
  - RF_Knee
  - LH_Hock

```

# 2 Recommended directory layout for a YOLO-Pose project

```text
cowpose/                    # ← dataset root (matches `path:` in cow9.yml)
│
├── cow9.yml                # dataset declaration you just defined
│
├── images/                 # all raw images live here
│   ├── train/              # ~80 % of images used for training
│   │   ├── 00001.jpg
│   │   ├── 00002.jpg
│   │   └── …
│   └── val/                # ~20 % reserved for validation
│       ├── 00081.jpg
│       ├── 00082.jpg
│       └── …
│
└── labels/                 # annotation files (one *.txt per image)
    ├── train/              # mirrors images/train
    │   ├── 00001.txt
    │   ├── 00002.txt
    │   └── …
    └── val/                # mirrors images/val
        ├── 00081.txt
        ├── 00082.txt
        └── …
```

# 3 data schema
Key terms in YOLO-Pose(in one line of a YOLO-Pose label file when you train with nine cow keypoints. Total values per line: 32 → 1 class + 4 box + 9 × 3 keypoints) :  
| Order # | Field (or triplet) | Type / Range          | Example value\*       | What it represents                                                                                                                                      |
| ------- | ------------------ | --------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1       | `class_id`         | integer, 0 – *(nc−1)* | `0`                   | Object class (only *cow* ⇒ 0).                                                                                                                          |
| 2       | `xc`               | float, 0 – 1          | `0.426654`            | **Normalized** x-coordinate of bbox centre:  $(x_{\min}+x_{\max})/2 ÷ W$.                                                                               |
| 3       | `yc`               | float, 0 – 1          | `0.525709`            | **Normalized** y-coordinate of bbox centre:  $(y_{\min}+y_{\max})/2 ÷ H$.                                                                               |
| 4       | `w`                | float, 0 – 1          | `0.442191`            | **Normalized** bbox width: $(x_{\max}-x_{\min}) ÷ W$.                                                                                                   |
| 5       | `h`                | float, 0 – 1          | `0.321108`            | **Normalized** bbox height: $(y_{\max}-y_{\min}) ÷ H$.                                                                                                  |
| 6 – 8   | `x₁ y₁ v₁`         | float float int       | `0.357977 0.686263 2` | Keypoint **1** (Nose)<br>· `x₁`, `y₁` are normalized coords.<br>· `v₁`: visibility (0 = not labelled, 1 = labelled + occluded, 2 = labelled + visible). |
| 9 – 11  | `x₂ y₂ v₂`         | …                     | `0.255559 0.685086 2` | Keypoint **2** (Poll / Forehead).                                                                                                                       |
| 12 – 14 | `x₃ y₃ v₃`         | …                     | `0.520147 0.677394 2` | Keypoint **3** (Withers).                                                                                                                               |
| 15 – 17 | `x₄ y₄ v₄`         | …                     | `0.449342 0.674126 2` | Keypoint **4** (Mid-Thoracic).                                                                                                                          |
| 18 – 20 | `x₅ y₅ v₅`         | …                     | `0.597750 0.490424 2` | Keypoint **5** (Sacrum / Hip).                                                                                                                          |
| 21 – 23 | `x₆ y₆ v₆`         | …                     | `0.571397 0.378995 2` | Keypoint **6** (Tail Base).                                                                                                                             |
| 24 – 26 | `x₇ y₇ v₇`         | …                     | `0.467102 0.365154 2` | Keypoint **7** (LF Knee).                                                                                                                               |
| 27 – 29 | `x₈ y₈ v₈`         | …                     | `0.333540 0.379604 2` | Keypoint **8** (RF Knee).                                                                                                                               |
| 30 – 32 | `x₉ y₉ v₉`         | …                     | `0.364341 0.386302 2` | Keypoint **9** (LH Hock).                                                                                                                               |

Notes : 
* All coordinates are divided by the original image width (W) or height (H) to fall in 0–1.  
* Visibility (v) defaults to 2 for any point you labelled in DeepLabCut (because DLC lacks an occlusion flag). Use 0 when the point is totally missing; use 1 only if you maintain a separate occlusion note during annotation.  

example : 
```text
0 0.426654 0.525709 0.442191 0.421108 0.357977 0.686263 1 0.255559 0.685086 1 0.520147 0.677394 1 0.449342 0.674126 1 0.597750 0.490424 1 0.571397 0.378995 1 0.467102 0.365154 1 0.333540 0.379604 1 0.364341 0.386302 1

```

DLC data example : 
```csv
scorer,,,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
bodyparts,,,left-hind-hoof,left-hind-hoof,right-hind-hoof,right-hind-hoof,left-front-hoof,left-front-hoof,right-front-hoof,right-front-hoof,nose,nose,forehead,forehead,withers,withers,sacrum,sacrum,caudal-thoracic-vertebrae,caudal-thoracic-vertebrae
coords,,,x,y,x,y,x,y,x,y,x,y,x,y,x,y,x,y,x,y
labeled-data,lameness_04,img008.png,305.7119460098037,329.40613572346876,218.2472520962378,328.8413760636557,444.20572821716405,325.1492441008955,383.7382585794964,323.58067554640536,510.4782101036082,235.4035860252773,487.9731233462359,181.91747074476908,398.9046999571733,175.27411879049947,284.84279482190146,182.20974459876092,311.14744168116783,185.42475699267123
```

# 4 DLC -> YOLO example

example code(This is a single, non-production script, making it easy to review the key steps.) : 
```python
"""
Create YOLO-Pose txt labels from DLC CollectedData_2.csv
Keeps 9 keypoints: nose, forehead, withers, sacrum, caudal-thoracic-vertebrae,
left-hind-hoof, right-hind-hoof, left-front-hoof, right-front-hoof
"""

import pandas as pd
import cv2
import numpy as np
from pathlib import Path
from tqdm import tqdm


def setup_paths():
    """Setup input and output paths."""
    root = Path("/Users/moloxiao/Desktop/low-512-2-2025-07-21")
    csv_file = root / "labeled-data/lameness_04/CollectedData_2.csv"
    img_dir = root / "labeled-data/lameness_04"

    # Output directories for train/val splits
    data_root = Path("/Users/moloxiao/Documents/code/ml/invercargill/data/cow1")
    train_label_dir = data_root / "labels/train"
    val_label_dir = data_root / "labels/val"
    train_label_dir.mkdir(parents=True, exist_ok=True)
    val_label_dir.mkdir(parents=True, exist_ok=True)

    return csv_file, img_dir, train_label_dir, val_label_dir


def get_keypoints_config():
    """Get keypoints configuration and validation files."""
    # Files for validation split
    val_files = {"img238", "img261", "img282", "img305"}

    # keypoints to keep (order = output order - must match cow5.yml)
    kp_keep = [
        "left-hind-hoof",
        "right-hind-hoof",
        "left-front-hoof",
        "right-front-hoof",
        "nose",
        "forehead",
        "withers",
        "sacrum",
        "caudal-thoracic-vertebrae",
    ]

    return val_files, kp_keep


def load_and_validate_csv(csv_file, kp_keep):
    """Load DLC CSV file and create column lookup."""
    # Read DLC CSV (3-row header)
    df = pd.read_csv(csv_file, header=[0, 1, 2])

    # First 3 columns hold metadata; the 3rd column is the image filename
    filename_series = df.iloc[:, 2].astype(str)

    # Map (bodypart, coord) → actual column label
    lookup = {}
    for col in df.columns[3:]:
        bp, coord = col[1], col[2].lower()  # ('', bodypart, x|y)
        if bp and coord in ("x", "y"):
            lookup[(bp, coord)] = col

    # Validate all required keypoints are present
    missing = [(p, c) for p in kp_keep for c in ("x", "y") if (p, c) not in lookup]
    if missing:
        raise ValueError(f"Missing columns: {missing}")

    return df, filename_series, lookup


def extract_keypoints(row, lookup, kp_keep, img_width, img_height):
    """Extract and normalize keypoints from a row."""
    xs, ys, vs = [], [], []
    for part in kp_keep:
        x = row[lookup[(part, "x")]]
        y = row[lookup[(part, "y")]]

        if np.isnan(x) or np.isnan(y):
            xs.append(0.0)
            ys.append(0.0)
            vs.append(0)  # not labelled
        else:
            xs.append(min(max(x / img_width, 0.0), 1.0))
            ys.append(min(max(y / img_height, 0.0), 1.0))
            vs.append(2)  # 2 means visible

    return xs, ys, vs


def calculate_bounding_box(xs, ys, vs, padding=0.05):
    """Calculate bounding box around visible keypoints."""
    # Find visible points
    vis = [i for i, v in enumerate(vs) if v > 0]
    
    if vis:
        xmin, xmax = min(xs[i] for i in vis), max(xs[i] for i in vis)
        ymin, ymax = min(ys[i] for i in vis), max(ys[i] for i in vis)
    else:  # no visible keypoints
        xmin = ymin = 0.0
        xmax = ymax = 1.0

    # Add padding
    xmin, ymin = max(0.0, xmin - padding), max(0.0, ymin - padding)
    xmax, ymax = min(1.0, xmax + padding), min(1.0, ymax + padding)

    # Calculate center and dimensions
    cx, cy = (xmin + xmax) / 2, (ymin + ymax) / 2
    bw, bh = (xmax - xmin), (ymax - ymin)

    return cx, cy, bw, bh


def create_yolo_line(xs, ys, vs, cx, cy, bw, bh, class_id=0):
    """Create YOLO format line with bbox and keypoints."""
    line = [class_id, cx, cy, bw, bh]  # class_id = 0
    for x, y, v in zip(xs, ys, vs):
        line += [x, y, v]
    return line


def save_label_file(line, filename, val_files, train_label_dir, val_label_dir):
    """Save YOLO label file to appropriate directory."""
    file_stem = Path(filename).stem
    if file_stem in val_files:
        output_dir = val_label_dir
    else:
        output_dir = train_label_dir

    label_content = " ".join(f"{v:.6f}" if isinstance(v, float) else str(v) for v in line) + "\n"
    (output_dir / f"{file_stem}.txt").write_text(label_content)


def process_images(df, filename_series, lookup, kp_keep, img_dir, val_files, train_label_dir, val_label_dir):
    """Process all images and create YOLO label files."""
    print("Writing YOLO label files …")
    for fname, (_, row) in tqdm(zip(filename_series, df.iterrows()),
                                total=len(df), unit="img"):

        img_path = img_dir / fname
        if not img_path.exists():
            print(f" image missing, skip: {img_path}")
            continue

        # Get image dimensions
        h, w = cv2.imread(str(img_path)).shape[:2]

        # Extract keypoints
        xs, ys, vs = extract_keypoints(row, lookup, kp_keep, w, h)

        # Calculate bounding box
        cx, cy, bw, bh = calculate_bounding_box(xs, ys, vs)

        # Create YOLO line
        line = create_yolo_line(xs, ys, vs, cx, cy, bw, bh)

        # Save label file
        save_label_file(line, fname, val_files, train_label_dir, val_label_dir)


def main():
    """Main function to orchestrate the label creation process."""
    # Setup paths
    csv_file, img_dir, train_label_dir, val_label_dir = setup_paths()

    # Get configuration
    val_files, kp_keep = get_keypoints_config()

    # Load and validate CSV
    df, filename_series, lookup = load_and_validate_csv(csv_file, kp_keep)

    # Process all images
    process_images(df, filename_series, lookup, kp_keep, img_dir, val_files, train_label_dir, val_label_dir)

    print(f" finished — labels saved to {train_label_dir} and {val_label_dir}")


if __name__ == "__main__":
    main()

```