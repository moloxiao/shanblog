+++
title = 'How to Move Your GoDaddy Domain to Cloudflare a Step by Step Guide'
date = 2024-08-06T20:00:29+12:00
draft = false
tags = ["GoDaddy", "Cloudflare", "Domain"]
+++
Managing your domain through Cloudflare offers numerous benefits, including enhanced security, improved website performance, and easy DNS management. **These are not the most important factors. The main reason is that you might need my help with day-to-day management, and personally, I prefer Cloudflare.**

If you have a domain registered with GoDaddy and want to move it to Cloudflare, follow this detailed step-by-step guide.

## Step 1: Create a Cloudflare Account and Add Your Site
1. Create a Cloudflare Account  
* Visit the [Cloudflare website](https://dash.cloudflare.com/).
* Click on “Sign Up” to register if you don’t already have an account.
* Once registered, log in to your Cloudflare account.

2. Add Your Domain to Cloudflare  
* After logging in, click on “Add a Site” on the Cloudflare dashboard.
* Enter your GoDaddy domain (e.g., “yourdomain.com”).
* Click “Continue”.  
![Add Your Domain to Cloudflare  ](/images/godaddy-to-cloudflare-01.png) 

## Step 2: Choose a Cloudflare Plan
* Cloudflare offers various plans, including a free plan and several paid plans. Choose the one that best fits your needs.
* Click “Continue”.  
![Add Your Domain to Cloudflare](/images/godaddy-to-cloudflare-02.png) 

## Step 3: Review and Confirm DNS Records
1. DNS Record Scanning  
* Cloudflare will automatically scan your current DNS records and list them for you.
* Review these records to ensure they are accurate. You can modify or add records as needed at this stage.  

2. Confirm DNS Records  
* Once you have confirmed that all DNS records are correct, click “Continue”.
![Confirm DNS Records ](/images/godaddy-to-cloudflare-03.png)  

## Step 4: Update Your Domain’s Nameservers
1. Get Cloudflare Nameservers  
* Cloudflare will provide you with two nameservers, such as addyson.ns.cloudflare.com and norman.ns.cloudflare.com.  
* copy nameservers.
![Update Your Domain’s Nameservers](/images/godaddy-to-cloudflare-04.png) 

2. Log in to Your GoDaddy Account
* Visit the [GoDaddy website]().
* Log in to your GoDaddy account.
* Click 'My Products'
![Go to Godaddy Dashboard](/images/godaddy-to-cloudflare-05.png) 

3. Access Domain Management  
* On the GoDaddy dashboard, find and click on “Domains”.  
![find and click on “Domains”](/images/godaddy-to-cloudflare-06.png) 
* Locate the domain you want to manage and click on “Domain Name”.  
![click on “Domain Name”](/images/godaddy-to-cloudflare-07.png) 

4. Change Nameservers
* In the DNS Management page, find the “Nameservers” section and click “Change”.
![find the “Nameservers”](/images/godaddy-to-cloudflare-08.png) 
* Select the “Custom” option.
* Enter the nameservers provided by Cloudflare.
* Save your changes.
![find the “Nameservers”](/images/godaddy-to-cloudflare-09.png) 
* Confirm
![find the “Nameservers”](/images/godaddy-to-cloudflare-10.png)  

## Step 5: Wait for DNS Propagation
The changes to the nameservers may take 24-48 hours to propagate across the internet.  **I only waited for 10 minutes.**
![find the “Nameservers”](/images/godaddy-to-cloudflare-11.png)  

## Conclusion
By following these steps, you can successfully transfer your GoDaddy domain to Cloudflare for management. 