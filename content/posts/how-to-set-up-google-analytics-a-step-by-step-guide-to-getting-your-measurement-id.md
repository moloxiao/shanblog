+++
title = 'How to Set Up Google Analytics a Step by Step Guide to Getting Your Measurement Id'
date = 2024-08-07T15:29:03+12:00
draft = false
tags = ["GoDaddy", "Cloudflare", "Domain", "conerstonechurch.org"]
+++
We use Google Analytics to track the number of visitors to our website, including information about when they visit and how they interact with our site. This helps us understand our audience better and improve our online presence.  
when you have a website and want your software engineer to support it with Google Analytics, You need to do two things:
1. Create a New Property
2. Get the Measurement ID and Send It to Your Software Engineer 

here is a step-by-step guide  
## Steps to Create a Google Analytics Property 

## Obtain the Measurement ID
1. **Sign In to Google Analytics**  
Go to [Google Analytics](https://analytics.google.com/) and sign in with your Google account.  

2. **Create a New Property** 
* From the Google Analytics homepage, click on the "Admin" button located at the bottom left corner of the page.
* In the "Property" column, click on "Create Property".
![Create](/images/ga-01.png) 
* Enter the property name, select the reporting time zone, and choose the currency.
* Click "Next" to proceed.
![input property](/images/ga-02.png) 
* input your business details, Click "Next"
* input your business objectives(my suggest you can choice "Examine user behaviour"), Click "Create"
![input business info ](/images/ga-03.png) 

3. **Configure Data Stream** 
* Choose the platform you want to track (e.g., “Web” for websites).
![Choose the platform ](/images/ga-04.png) 
* Enter the website URL and name the data stream.
* Click “Create Stream” to generate the data stream.
![Create Stream ](/images/ga-05.png) 

4. **Obtain the Measurement ID**
* After creating the data stream, you will see a summary page with your “Measurement ID” (e.g., G-XXXXXXXXXX).
* Copy this Measurement ID send to your software engineer, as it will be used to configure Google Analytics in your project.
![Create Stream ](/images/ga-06.png) 