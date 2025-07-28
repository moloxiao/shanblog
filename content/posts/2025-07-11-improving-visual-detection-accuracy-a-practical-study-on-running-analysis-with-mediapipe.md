+++
title = 'Improving Visual Detection Accuracy: A Practical Study on Running Analysis with MediaPipe'
date = 2025-07-10T20:00:00+12:00
draft = true
tags = ["MediaPipe", "CV"]
description = "During continuous motion, MediaPipe struggles to capture joint data in every frame, and how to address this issue in practical engineering cases."
+++


# 1 MediaPipe basic
MediaPipe—specifically its Pose Landmark Detection—provides a tool for identifying key human joints. This technology can be used for assisted analysis; in this article, we apply it to examine the running posture of adolescents.  

![Mediapipe pose landmarks index](/images/2025-07/pose_landmarks_index.png)
```
0 - nose
1 - left eye (inner)
2 - left eye
3 - left eye (outer)
4 - right eye (inner)
5 - right eye
6 - right eye (outer)
7 - left ear
8 - right ear
9 - mouth (left)
10 - mouth (right)
11 - left shoulder
12 - right shoulder
13 - left elbow
14 - right elbow
15 - left wrist
16 - right wrist
17 - left pinky
18 - right pinky
19 - left index
20 - right index
21 - left thumb
22 - right thumb
23 - left hip
24 - right hip
25 - left knee
26 - right knee
27 - left ankle
28 - right ankle
29 - left heel
30 - right heel
31 - left foot index
32 - right foot index
```

# 2 


# Reference
Doc :  
* [MediaPipe Solutions guide](https://ai.google.dev/edge/mediapipe/solutions/guide)
* [Pose landmark detection guide](https://ai.google.dev/edge/mediapipe/solutions/vision/pose_landmarker#models)

Blog :  
* [On-device, Real-time Body Pose Tracking with MediaPipe BlazePose](https://research.google/blog/on-device-real-time-body-pose-tracking-with-mediapipe-blazepose/)

Others :  
* [Google AI PRINCIPLES](https://ai.google/responsibility/principles/)
* [Google AI edge](https://ai.google.dev/edge)