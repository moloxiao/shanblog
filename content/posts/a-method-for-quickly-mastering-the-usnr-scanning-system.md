+++
title = 'A Method for Quickly Mastering the USNR Scanning System'
date = 2024-09-02T22:17:29+12:00
draft = false
tags = ["IOT", "USNR", "TimberProcessing"]
+++
![landing page](/images/2024-09/dall.e-01.png)  
I have never used the USNR Scanning system before. This article **outlines** my plan for quickly mastering the system and developing the capability for ongoing maintenance and improvement.  

# 1 Goals & Metrics  
The goal can be divided into two stages :
1. **Proficiency** : Become familiar with the USNR system as an assistant, understand the manual, learn the operating procedures, and handle common issues.
2. **Control** : Understand the wood processing steps, and master the role of the USNR system at each step

Tasks for **Proficiency** :  
1. Learn and perform each step, then create a manual. 
2. understand how things work, and write down solutions for common problems(**troubleshooting**).
3. Develop emergency procedures for handling unexpected issues


Tasks for **Control** :
1. Understand the functionality of each module.
2. Understand the communication protocols between modules.
3. Understand the strengths and weaknesses of each module and the methods for replacing different suppliers.
4. Familiarize yourself with the implementation methods of different modules, trends in new technologies, and the technology roadmaps of various suppliers.

>**IT Tips** : We plan to use [Docusaurus](https://docusaurus.io/) to create and maintain our knowledge documentation.

# 2 Modules & Protocol 
The division of modules in USNR is complex, but imagine an experienced craftsman handling the Primary Breakdown of wood processing typically follows these steps:  

|Steps| Main Job |
|--|--------|
|**Inspection**| This involves visually inspecting the wood, taking manual measurements, and analyzing the grain to identify defects, characteristics, and dimensions.|
|**Cutting Plan**|Based on the inspection, a cutting plan is created to make the best use of the wood, minimize waste, and avoid cutting in areas with significant defects.|
|**Processing and Adjustment**| Throughout the processing, adjustments are made to adapt to the wood's characteristics and changes, ensuring that the process remains both high-quality and efficient.|  

Based on the current understanding, the core steps are :  
* Inspection
* Cutting Plan
* Processing and Adjustment

## 2.1 Inspection
Task objectives :  
T-1 Develop a database for each scanner, including details such as sensor type, chip type, data export formats, and key detection metrics   
T-2 Create a standardized database for different task types(cutting plan), specifying the data types required for each task   

## 2.2 Cutting Plan
Task objectives :  
T-3 Requirements for sensor parameters  
 

## 2.3 Processing and Adjustment
Task objectives :    
T-4 Protocols for sending instructions to cutting machines  
T-5 Protocols for monitoring cutting machine execution 

# Summary
Key points for achieving the above goals by using IT technology :  
1. Build a documentation **knowledge system** using Docusaurus. 
2. Establish a **data pipeline** to capture key data during the use of USNR. 
3. Utilize a SaaS solution to analyze this data for decision support.