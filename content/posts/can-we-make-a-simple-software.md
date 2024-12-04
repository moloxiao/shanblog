+++
title = 'Can We Make a Simple Software'
date = 2024-12-03T15:25:30+13:00
draft = false
tags = ["ShanThinking", "Software"]
description = "Can We Make a Simple Software or Why Can't We Make Simple Software? Let's talk about it from Complexity."
+++
![Monkey island, invercargill, Southland, New Zealand](/images/2024-12/screen-01.png) 
I wrote a system with over 800,000 lines of code, but one day I lost my passion for it. I realized it was becoming increasingly difficult to keep it maintainable. So I start think : Can We Make a Simple Software ?  


# What is complexity
**Shan's define** : Complexity describes interaction and interconnectedness. When there are too many relationships between elements, it can make things challenging to manage.  
The most interesting part is comparing complexity and difficulty :  
| **Aspect**          | **Complexity**                          | **Difficulty**                         |
|----------------------|-----------------------------------------|----------------------------------------|
| **Focus**           | Interconnectedness or structure         | Effort, skill, or resources needed     |
| **Objective vs. Subjective** | Often objective (inherent in the task) | Often subjective (depends on the person) |
| **Example**          | Building a machine with many parts      | Assembling a machine without the right tools or training |
| **Relative**         | Does not necessarily depend on skill    | Can vary widely based on skill level   |

Since Descartes, we have believed that any large system can be divided into smaller parts. If we can solve the problems within each small part, we can solve the problems of the entire system. Difficulty describes the challenge within each small part, while complexity describes the challenge of the system's interactions and the interconnectedness between its parts.  


# Where is the complexity come from
Shan : interaction & limit resources.  

Complexity is come from :  
* scale of the system : A better description is engineering challenges, including reliability, scalability, and maintainability.
* the number of interactions between components : As requirements change, the initial module division is no longer reasonable.
* the level of abstraction : My question is, can we design a system that works at different levels of abstraction? The answer is yes. If every process operates at the same level of abstraction, the system can be easily extended.

how complexity can be managed and mitigated through various techniques :  
* starting over  : The object model may become too complex with new requirements and perspectives, requiring a redesign
* reducing dependencies  
* simplifying the architecture : change the component or relationship

# Can We Make a Simple Software  
No.  
That means some system will be very complxity(If 'simple' is the opposite of 'complexity'), and we could not make it simple. This is because of the definition of complexity. It feels a bit like a word game, but it can help us think.

# Reference
* [Alan Kay, 2015: Power of Simplicity](https://www.youtube.com/watch?v=NdSD07U5uBs)
* [Why Can't We Make Simple Software? - Peter van Hardenberg](https://www.youtube.com/watch?v=czzAVuVz7u4&t=343s)
