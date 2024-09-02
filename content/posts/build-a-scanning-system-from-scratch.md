+++
title = 'Build a Scanning System From Scratch'
date = 2024-09-03T13:45:52+12:00
draft = true
tags = ["IOT", "USNR", "TimberProcessing"]
+++
I want to learn about USNR's scanning solutions, and the best approach is to implement a system myself. My main goals are to:
1. Understand the overall architecture and process
2. Grasp the key technical aspects and their impact on wood processing
  
With these goals in mind, **I plan to create a system that delivers 60% to 80% of the functionality at just 5% of the cost**. This solution will help small-scale processing plants that haven't yet adopted IT tools to improve their efficiency.  

To control the scope of the solution, add the following constraint: 
1. Include only the **Primary Breakdown** stage  

# Goals  

There have two different perspectives on the involvement:
1. **Assistant**: Involves participating in some sub-steps and recording data.
2. **Full Solution(robot)**: Involves overseeing the entire process, managing exceptions, and handling overall supervision.  

Although our initial goal was to achieve a Full Solution, and the automation level of the machine might be only 5% at the start, we still chose to begin the task with the approach of building a Full Solution.  

We need to complete two tasks:
1. Understand the entire process.
2. Divide the process into modules, define the responsibilities of each module, and establish communication protocols between them.

Let's start with the first task and imagine an experienced craftsman handling the Primary Breakdown of wood processing typically follows these steps:  

|Steps| Main Job |
|--|--------|
|**Inspection**| This involves visually inspecting the wood, taking manual measurements, and analyzing the grain to identify defects, characteristics, and dimensions.|
|**Cutting Plan**|Based on the inspection, a cutting plan is created to make the best use of the wood, minimize waste, and avoid cutting in areas with significant defects.|
|**Processing and Adjustment**| Throughout the processing, adjustments are made to adapt to the wood's characteristics and changes, ensuring that the process remains both high-quality and efficient.|  

Based on the above analysis, we will now move on to the second task. We will divide the process into the following modules :  
* Inspection
* Cutting Plan
* Processing and Adjustment




