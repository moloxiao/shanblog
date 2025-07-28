+++
title = 'Video-based Automatic Lameness Detection : A literature review in 2025'
date = 2025-07-13T20:16:04+13:00
draft = true
tags = ["Lameness", "CV", "Dairy"]
description = ""
+++


# 1 Introduction

## 1.1 Why need study

* Lameness is a painful gait disorder in dairy cows? so How to find?
* characterized by abnormal locomotion of the cow

Why import : 
* a negative impact on welfare
* leads to substantial economic losses(decreased milk production, reproduction, premature culling)

pain spot : 
* While lameness is commonly assessed by trained observers performing visual locomotion scoring of the herd 
* the procedure is time-consuming and cannot realistically be performed on a regular basis


## 1.2 Video cameras

* Video cameras are an attractive sensor for this application as they are relatively inexpensive, non-intrusive, and scale well with large herds

A three-step approach is commonly taken to detect lameness from videos: 
1. use computer vision methods to localize body parts of interest, 
2. compute one or more locomotion traits from the extracted body parts, and 
3. train a classifier to score lameness using the locomotion traits as features. 

Three critical gaps emerge from the studies discussed so far: 
1. the use of obsolete image processing methods remains frequent, 
2. no one combined more than two locomotion traits for lameness classification, and 
3. the reliability of the ground truth is seldom reported. 

six locomotion traits :  
1. back posture measurement, 
2. head bobbing, 
3. tracking distance, 
4. stride length, 
5. stance duration, and 
6. swing duration


# 2 Method

## 2.1 Post

1. 点位确定
2. 差别

# References


basic knowlege :  
* [Dairynz : Lameness](https://www.dairynz.co.nz/animal/lameness/)

* [Identifying lameness](https://www.dairynz.co.nz/animal/lameness/identifying-lameness/)
* [Analysis of individual classification of lameness using automatic measurement of back posture in dairy cattle](https://www.sciencedirect.com/science/article/pii/S0022030212008466)

* [LARGE ANIMAL ANATOMY - Pelvis and Perineum](https://pressbooks.umn.edu/largeanimalanatomy/chapter/pelvic-inlet-perineum/)


company : 
* [cattle eye](https://cattleeye.com/)
* [Herd-i](https://herd-i.com/)

Computer version :  
* [2024:Video-based Automatic Lameness Detection of Dairy Cows using Pose Estimation and Multiple Locomotion Traits](https://arxiv.org/abs/2401.05202)
* [Detecting Lameness in Dairy Cows Based on Gait Feature Mapping and Attention Mechanisms](https://www.mdpi.com/2077-0472/15/12/1276)
* [Deep learning pose estimation for multi-cattle lameness detection](https://pmc.ncbi.nlm.nih.gov/articles/PMC10024686/)


youtube Video : 
* [Lameness Scoring](https://www.youtube.com/watch?v=yldSs75RYTQ)
* [DairyNZ Healthy Hoof Lameness Scoring](https://www.youtube.com/watch?v=pa88nfVq6pE)

open source project : 
* [2019-Lameness-Detection](https://github.com/whsu2s/Lameness-Detection/tree/master)

* [2024 hrussel:lameness-detection](https://github.com/hrussel/lameness-detection)

Dataset :  
* [Animal Pose dataset - not just for cow, all animals](https://github.com/noahcao/animal-pose-dataset/tree/master?tab=readme-ov-file)