+++
title = 'Reading Notes Series 1 Achieving Rapid Response Times'
date = 2024-11-12T15:30:57+13:00
draft = false
tags = ["ReadingNotes", "Software"]
description = "Notes and key insights from the paper 'Achieving Rapid Response Times in Large Online Services' by Jeff Dean."
+++

This is my first blog post in the Reading Notes Series. Ten years ago, [Jeff Dean](https://research.google/people/jeff/) presented these insights at the 2014 O'Reilly Velocity Conference in Santa Clara, CA. Now, a decade later, are these tips still relevant? Let's take a closer look.  

For more details, you can check out the [Video](https://www.youtube.com/watch?v=1-3Ahy7Fxsc&t=376s)  or [Slide-PDF](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/44875.pdf).

By the way, I initially planned to spend just 2 hours reading these papers and watching the video, but I think I'll actually need a whole week (about 2 hours a day) to complete the summary.

I wrote this blog for two purposes:   
1. to share some of my insights; 
2. to organize and integrate the technical details mentioned by Jeff Dean into a structured framework, creating a clear thought process.  


# Tpoic 1 : Squash All Variability

Possible at small scale :  
* dedicated resources
* complete control over whole system
* careful understanding of all background activities
* less likely to have hardware fail in bizarre ways

Software or hardware changes affect delicate balance, so that will make system changes are difficult(Not tenable at large scale: need to share resources).   

Next step is : **Shared Environment**, Huge benefit: greatly increased utilization, but hard to predict effects increase variability(Exacerbated by large fanout systems) :
* network congestion
*  background activities
* bursts of foreground activity
* not just your jobs, but everyone else’s jobs, too  

So it's not work.  

## Topic 2 : Basic Latency Reduction Techniques  
Sort of really rein in the long tail of latency without increasing the performance cost of the system too much.  
First way is **Differentiated service classes** :  
* prioritized request queues in servers
* prioritized network traffic  

Second way is **Reduce head-of-line blocking** :  
* break large requests into sequence of small requests  

Third way is **Manage expensive background activities** :  
* e.g. log compaction in distributed storage systems
* rate limit activity
* defer expensive activity until load is lower  

## Topic 3 : Tolerating Faults vs. Tolerating Variability
Tolerating faults:  
* rely on extra resources (RAIDed disks, ECC memory, dist. system components, etc.)
* **make a reliable whole out of unreliable parts**

Tolerating variability:  
* use these same extra resources
* **make a predictable whole out of unpredictable parts**  

Times scales are very different:  
* variability: 1000s of disruptions/sec, scale of milliseconds
* faults: 10s of failures per day, scale of tens of seconds

# Contents[Topic 1]

* Large Fanout Services
* 

## 1 Large Fanout Services
**Definition**: Large Fanout Services are systems that handle requests by querying multiple backend services or subsystems in parallel. They are common in large-scale systems like search engines, ad services, and recommendation engines, where each request depends on data from many sources.

**Challenges**: The primary challenge in Large Fanout Services is managing "tail latency," where the slowest responses from backends can delay the overall response time. Since these services depend on multiple responses, even a few slow replies can impact the user experience.

**Optimization Goal**:  
* consistently rapid response times  

**Method**:  
1. Request Redundancy: Sending duplicate requests to multiple servers and using the first response, helping to avoid delays from slow servers.
2. Timeout Management: Setting precise time limits for requests to ensure they don’t wait indefinitely and instead proceed with partial data if necessary.
3. Distributed Caching: Caching frequently accessed data to reduce dependency on slower backends, speeding up response times for repeated requests.



# Reference

* [如何在大规模在线系统中保证延迟？](https://github.com/dirtysalt/dirtysalt.github.io/blob/master/src/achieving-rapid-response-times-in-large-online-services.org)