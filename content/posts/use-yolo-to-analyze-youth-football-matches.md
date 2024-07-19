+++
title = 'Use Yolo to Analyze Youth Football Matches'
date = 2024-07-03T14:52:22+12:00
draft = false
tags = ["Football", "ML", "AI", "YOLO"]
+++
I discuss youth soccer games with my 10-year-old son. I think it's important to first help him understand when making certain decisions is beneficial. So, I'm looking for a way to help young athletes develop their decision-making skills.  
One important tool for this is watching game videos.
  
While watching and learning from game videos together, I started thinking about some questions: 
* Is there a connection between teams that run more and winning? 
* What is the relationship between ball possession and winning?  

So I used Python, along with YOLO and OpenCV, to create a prototype, like this :  
![oduio](/images/football_game_kids_01.png)

**Current Model Performance** :  
* **Television Broadcasts: The model performs reasonably well.**
* **Casual Youth Game Footage: The model performs poorly.**

## Core Steps

1. **Object detection and tracking** ： Find the players and the ball, and then track the players' movements across the video
2. **Player color assignment** ： Recognize the different teams by their jersey colors.
3. **Ball interpolation** : In many frames, the ball can't be recognized, so we need to use interpolation algorithms to estimate where the ball might be. Then, we need to determine ball possession based on the ball's position
4. **Camera movement estimator and Perspective Transformer** : This is an engineering problem. We need to consider the camera's movement and shooting angle to project the positions of the players and the ball onto a 2D coordinate system
5. **Speed and distance Estimator**

## Questions and Future Plans 
The main issue is learning how to film properly. Here is a screen from a video broadcast :  
![oduio](/images/football_game_01.png)  
  
When comparing youth games to professional broadcasts, we notice the following differences: 
1. fewer outside distractions (no spectators on the sidelines)
2. uniform attire (players and referees)
3. better shooting angles and camera movements
4. clear field boundaries.

**Main Improvement Goals**:
* Filming: This is the primary area for improvement.
* Model Performance: Currently acceptable.
  
**Specific Improvements**:
1. Wider Coverage: Capture the entire field from a distance (ideally using drones, though often this is not permitted).
2. Clear Field Boundaries: Ensure the outlines of the field are clearly visible.
3. Reduce Interference: Minimize distracting elements in the footage.