+++
title = 'Why Redis So Fast Is a Good Question'
date = 2024-08-14T15:53:09+12:00
draft = true
+++
three reason why redis is lightning fast? the last one is a bit unintuitive.  
Redis store data in memory rather than on disk. Reading from RAM is way faster than from hard drive.  
and since it's in memory, redis tap simple powerful data structures, like hash tables, linked lists and skip lists.  
No messy on disk storage to slow down.  

And get this, redis uses just a single thread for network request. I know seems crazy right? Wouldn't more threads be faster?  
In other databases, multi-threading  can slow things down due to lock contentions, but redis dodges all that by using just one fast thread.
SO how does it handle thousands of requests with one thread? I/O multiplexing. this lets redis efficiently juggle many requests with single thread.

| seq | layer | times | slow than last layer|
| --|--|--|----|
|1|Register|0.3ns| NA|
|2|L1 Cache|0.9ns| NA|
|3|L2 Cache|2.8ns| NA|
|4|L3 Cache|12.9ns| NA|
|5|RAM|120ns|  |
|6|SSD|50-150us| |
|7|HDD|1-10ms|  |