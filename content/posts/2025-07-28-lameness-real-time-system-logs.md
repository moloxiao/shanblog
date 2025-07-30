+++
title = 'Lameness Real-Time System logs'
date = 2025-07-28T10:00:00+12:00
draft = false
tags = ["Lameness", "CV"]
description = ""
+++
> last update : 2025-07-31
This is my side project, and I'm using it to document the logs during the prototyping phase. I'm trying to build a simple and low-cost camera-based system to help automate the detection of lameness in cows. I'm trying to answer these questions :   
1. Using current open-source methods, what level of accuracy can be achieved for specific problem detection?  
2. What are the typical optimization strategies, and what is the ROI for each?
3. Does a deep understanding of fundamental principles, like CNNs, lead to improved accuracy? What specific aspects benefit from this knowledge?   


# 1 Logs & Plans 
| Week | Phase | Checkpoint| Key Deliverables| Acceptance Criteria |
| ---- | ----------------------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| 2    | Data Annotation & Initial Model Training              | Completion of DLC labeling and initial YOLO Pose training                | 20–50 images annotated with DLC, initial YOLO Pose model trained             | Annotation error < 5 pixels;<br>YOLO Pose mAP ≥ 70%                                                                     |
| 4    | Lameness Detection Algorithm Development & Validation | Implementation and initial video testing of lameness detection algorithm | First version of lameness detection algorithm tested on videos               | Detection accuracy ≥ 70%;<br>At least 10 video samples (5–8 seconds each) tested                                        |
| 6    | Automated Data Processing Pipeline Setup              | Initial automation pipeline developed                                    | Automatic video capture → Upload to S3 → Automated processing & notification | Pipeline success rate ≥ 90%;<br>Processing delay ≤ 10 mins;<br>Logging functionality enabled                            |
| 8    | System Integration & Final Validation                 | Complete system test, optimization, and stability verification           | Comprehensive technical documentation and user manual completed              | Overall accuracy ≥ 75%;<br>System stability ≥ 95%;<br>Processing delay ≤ 10 mins;<br>Clear and extensible documentation |


## 1.1 Week 1~2 : Data Annotation & Initial Model Training
Our goal is : 
* Annotation error < 5 pixels;
* YOLO Pose mAP ≥ 70% 

tips :  
* [Q1 : How is the 70% mAP target determined?](#q1--how-is-the-70-map-target-determined)
* [Q2 : What is the potential for further improvement in model accuracy? ](#q2--what-is-the-potential-for-further-improvement-in-model-accuracy)
* [Q3 : What are the real barriers to commercialization](#q3--what-are-the-real-barriers-to-commercialization)
* [DLC to yolo](/posts/2025-07-29-dlc-to-yolo/)

logs :   
| Seq |Date | Do | Cost | Explain |
| - | ---- |---- | --| ---- |
| 1 | 07-28 | 2 weeks plan | 2 hours| |
| 2 |  07-29 | DLC training data  |  | use UI tools tag |
| 3 |  07-29 | change to yolo pose format  |  | yolo pose 11|
| 4 |  07-29 | yolo training  |  | yolo pose 11 |
| 5 |  07-31 |  format DLC->yolo script |  |  |

# FAQ

## Q1 : How is the 70% mAP target determined?
The 70% mAP (mean Average Precision) target is a realistic and widely adopted benchmark for initial pose estimation model validation in the animal behavior analysis domain.

This target is based on:

* Industry experience: Both academic literature and commercial implementations (e.g., CattleEye, Herd-i) show that with 20–50 well-annotated images, a YOLO Pose model typically achieves 65–75% mAP after initial training.
* Model capability: YOLOv11-Pose is a lightweight yet powerful architecture. When trained on accurate DeepLabCut (DLC) annotations, it reliably produces reasonable results, even with small datasets.
* Startup phase needs: A 70% mAP is high enough to demonstrate proof-of-concept validity but does not require exhaustive data labeling or model tuning, making it ideal for rapid iteration.

In summary, it’s a practical baseline for technical validation, not an upper limit.

## Q2 : What is the potential for further improvement in model accuracy?  
there is substantial room for improvement after the initial 70% baseline — especially by increasing data size and training diversity.  

| Effort Area                                  | Typical Improvement       |
| -------------------------------------------- | ------------------------- |
| Increasing dataset to 100–200 images         | +10–15% mAP (up to \~85%) |
| Better lighting and camera positioning       | +3–5% mAP                 |
| Model tuning and hyperparameter optimization | +2–4% mAP                 |
| Advanced augmentations or backbone upgrades  | +2–5% mAP                 |

Once the model reaches 85–90% mAP, further gains become harder and more expensive, due to:  
* Diminishing returns on annotation and training effort
* Limited visual information quality from real-world farm conditions
* Natural variance in animal behavior and environment

**Above 90% mAP is possible** but often not justified unless the application demands near-perfect precision. Commercial systems typically balance between performance and operational cost.

## Q3 : What are the real barriers to commercialization
Reaching 80–85% mAP is technically feasible with existing tools, true commercialization challenges lie beyond model accuracy.  
Real Barriers:  
| Barrier                         | Description                                                                                 |
| ------------------------------- | ------------------------------------------------------------------------------------------- |
| **Robustness & Generalization** | Adapting to different farm layouts, cow breeds, lighting, weather, and movement variability |
| **System reliability**          | Long-term stable operation with minimal maintenance in rough farm environments              |
| **Low-cost deployment**         | Reducing the total cost of ownership: camera setup, compute hardware, and cloud storage     |
| **ROI justification**           | Convincing farm operators that the system delivers tangible, timely financial benefits      |
| **UX and integration**          | Easy-to-use interfaces, simple report generation, seamless farm system integration          |

To succeed as a startup, focus not on reinventing the algorithm, but on:  
1. **Fast deployment, low maintenance** : Plug-and-play camera kits, minimal calibration
2. **Cost-effective edge computing** : Perform pose detection on edge devices to reduce cloud dependence
3. **Clear ROI for farmers** : Simple dashboards showing actionable alerts (e.g., “This cow may be lame”), backed by historical comparison
4. **Data feedback loop** : Build tools that allow farmers to confirm or correct detection, feeding back into the model to improve accuracy over time
5. **Modular architecture** : Make your system easy to upgrade with better models, more sensors, or additional features later on


## TODO : Q4 : some basic information about yolo


[YOLOv11: An Overview of the Key Architectural Enhancements](https://arxiv.org/html/2410.17725v1)