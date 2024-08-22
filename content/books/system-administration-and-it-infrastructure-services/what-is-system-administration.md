+++
title = "What is System Administration"
weight =  2
date = 2024-08-21T11:30:43+12:00
+++

The basics of system administration :  
* organizational policies
* IT infrastructure services
* user and hardware provisioning
* routine maintenance
* troubleshooting
* managing potential issues

Not contains in this book, like : 
* automate workflow 
* managed configrations
* computer settings automatically

# What is systems administration

# Servers Revisited 
Basically, a sys admin is responsible for their company's IT service. Employees need these IT services so that they can be productive.   

# System Administration Tasks

* Organizational Policies
* IT infrastructure  
* User and Hardware Provisioning(Procurement->Deployment->Maintenance->Retirement)
* Routine Maintenance
* Vendors
* Troubleshooting and Managing Issues
* In Case of Fire, Break Glass(You can't account for everything but you can be prepared to recover from it.)  



There are just a few of the policy questions(organizational policies) that can come up  :  
* Should users be allowed to install software?  
* Should users have complex passwords with certain requirements?  
* Should users be allowed to view non-work-related websites, like Facebook?  
* If you hand out a company phone to an employee, should you set a device password?  
  
  Whatever policies are decided upon have to be documented somewhere. If you're managing systems, you'll be responsible for documenting your company's policies, routine procedures and more.

# Applying Changes

With Great Power Comes Great Responsibility :  
* The most important thing is to a void using administrative rights for tasks that don't require them
* Respect the privacy of others. Don't use your administrator rights to access private information that you have no business accessing  
* Think before you type
* Reverting to the previous state is called a rollback

Never Test in Production :  
*  **Producation** : the parts of the infrastructure where certain service is executed and serve to its users production
* **test environment** : is usually a virtual machine running the same configuration as a production environment, but isn't actually serving any users of the service
* **secondary or a stand-by machine** : This machine will be exactly the same as a production machine, but won't receive any traffic from actual users until you enable it to do so.
  
Assessing Risk :  
* 

Fixing Things the Right Way :  
* reproduction case : means you are creating a roadmap to retrace the steps that led the user to an unexpected outcome, like reaching an error page.  


When looking for a reproduction case, there are three questions you will need to answer :  
1. What steps did you take to get to this point? 
2. What's the unexpected or bad result?   
3. What's the expected result?  

Remember, always do this in your test instance, never in production
Make sure you document all your steps and any findings