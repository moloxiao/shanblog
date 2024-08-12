+++
title = "Application Integration : it's all about the adapter"
date = 2024-08-13T10:53:43+12:00
draft = false
tags = ["Coding"]
+++
![Header](/images/2024-08-13-01.webp) 
Integration development is not a standardized term, so there isn't a dedicated page for it on Wikipedia.  
In this article, it defines **application integration** as the process of enabling individual applications to communicate with each other.  

For me, **integration means adapter**. Let me explain it.

## Basic skills  
Fundamental skills :  
1. **Protocols** : HTTP, XML, messaging protocols, web services, and web sockets are some of the most common protocols used in application integration.
2. **Formats** : EDI, HL7, SWIFT, and other standards are often used in enterprise businesses to facilitate communication between systems.

View from a higher perspective :  
1. **SaaS or API connectors** : REST APIs are commonly used to interact with SaaS services. These APIs typically support CRUD operations (create, read, update, delete) and webhooks. Webhooks allow for callback-based interactions, enabling event-driven functionality.
2. **Data operations** : routing, transformation, filtering, and publication/subscription patterns are some of the common data operations used in application integration.

## Approaches
It can be categorized into two approaches: 
1. **direct computation from the sources** 
2. **storing the data first before computation**  

Common messaging patterns :  
1. **request-reply**  
2. **publish-subscribe**  
3. **event sourcing**  

Several key technical focus areas are:  
1. **Implementation** : Primarily focused on adapter conversion.
2. **Data Transmission** : Emphasizes data compression.
3. **Performance** : Involves cache, load balancing, and asynchronous processing to reduce latency.
4. **Network Latency Handling** : Utilizes Cloudflare and implements timeout retry mechanisms.
5. **Security** : Ensures data encryption.  

In most cases, it's sufficient to implement the functionality according to the User Guide. Data compression and performance optimization become specialized topics when they are actually needed.

## Summarize
Let me summarize :  
1. Understand the protocols being used 
2. Choose the appropriate messaging pattern 
3. Implement the **adapter**

If you encounter various technical challenges, address them with the appropriate solutions. But fundamentally, **it's all about the adapter**.