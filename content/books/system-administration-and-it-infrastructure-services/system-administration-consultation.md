+++
title = "System Administration Consultation"
weight =  8
date = 2024-08-23T19:12:12+12:00
+++


## Scenario 1  
You’re doing systems administration work for Network Funtime Company. Evaluate their current IT infrastructure needs and limitations, then provide at least five process improvements and rationale behind those improvements. Write a 200-400 word process review for this consultation. Remember, there’s no right or wrong answer, but make sure to provide your reasoning.  

**Software Company** :  

Network Funtime Company is a small company that builds open-source software. The company is made up software engineers, a few designers, one person in Human Resources (HR), and a small sales team. Altogether, there are 100 employees. They recently hired you as a system administrator to come in and become their IT department.

When a new person is hired on, the HR person purchases a laptop for them to do their work. The HR representative is unfamiliar with what type of hardware is out there; if a new employee requests a laptop, the HR person will purchase the cheapest option for a laptop online. Because of this, almost everyone has a different laptop model. The company doesn’t have too much revenue to spend, so they don’t order laptops until someone gets hired at the company. This leads to a few days of wait time from when someone starts to when they can actually work on a laptop.

The company doesn’t label their computers with anything, so if a computer is missing or stolen, there’s no way to audit it. There’s no inventory system to keep track of what’s currently in the fleet.

Once a computer is purchased, the HR person hands it to the new employee to set up. Software engineers that use Linux have to find a USB drive and add their preferred distribution to the laptop. Anytime someone needs something from HR -- whether it’s office related or tech related -- they email the HR representative directly.

When a new employee gets a machine, they’re given logins to use cloud services. They get a personal orientation with HR to make sure they can login. This requires the HR person to block off a few hours for every new employee. If an employee forgets the login to their machine, they have no way to retrieve a password and they have to reimagine their machine. Employees don’t have a strict password requirement to set for their computers.

The company currently has many of their services in the cloud, such as email, word processors, spreadsheet applications, etc. They also use the application, Slack, for instant communication.

**answer by chatGTP-4o** :  
Network Funtime Company faces several challenges in its IT infrastructure:

Diverse Laptop Models and Delays: Employees receive varying laptop models based on HR's limited knowledge and budget constraints, leading to inconsistent performance and delayed productivity.
Lack of Inventory and Security: Absence of an inventory system and labeling results in no tracking of assets, making it difficult to manage and secure equipment.
Inconsistent Setup Process: The setup process is manual and inefficient, with employees handling their own software installations, particularly those using Linux.
Inefficient HR Processes: HR is overloaded with tech-related requests, impacting their efficiency and the onboarding experience.
Weak Security Practices: Weak password policies and lack of a password retrieval system pose security risks and operational inefficiencies.
Process Improvements and Rationale

Standardize Hardware Procurement: Implement a standardized laptop model for all employees, selected based on performance and cost-effectiveness. Establish a central IT budget to purchase and stock these laptops, reducing wait times and ensuring uniformity in hardware, which simplifies maintenance and support.

Implement Asset Management and Labeling: Introduce an asset management system to track all company-owned equipment. This system should include unique labels for each laptop to facilitate easy identification and audit trails. Regular inventory checks should be scheduled to maintain accurate records and ensure security.

Automate and Streamline Onboarding: Develop a streamlined onboarding process that includes pre-configured laptops with necessary software and access rights. Create standard operating procedures for the initial setup, reducing the need for manual intervention and freeing HR resources.

Centralize IT Support and Request Management: Establish a dedicated IT support team or service desk that handles all tech-related requests, including onboarding and password resets. Implement a ticketing system to manage and track these requests, improving efficiency and allowing HR to focus on their core responsibilities.

Enforce Security Policies: Introduce and enforce strong password policies for all employees. Implement a password management solution that allows employees to securely retrieve or reset passwords without needing IT intervention. Regularly update and audit security protocols to safeguard company data and systems.

# Scenario 2
You’re doing systems administration work for W.D. Widgets. Evaluate their current IT infrastructure needs and limitations, then provide at least five process improvements and rationale behind those improvements. Please write a 200-400 word process review for this consultation. Remember, there’s no right or wrong answer, but make sure to provide your reasoning.  

**Sales Company** :  
W.D. Widgets is a small company that sells widgets. They’re mostly made up of salespeople who work with lots of clients. You’ve taken over as the sole IT person for this company of 80-100 people.

When HR tells you to provision a machine for a new employee, you order the hardware directly from a business vendor. You keep one or two machines in stock, in case of emergency. The users receive a username that you generate for them. You then give them an orientation on how to login when they start. You currently manage all of your machines using Windows Active Directory. The company uses only Windows computers. When a new computer is provisioned, you have to install lots of sales-specific applications manually onto every machine. This takes a few hours of your time for each machine. When someone has an IT-related request, they email you directly to help them.

Almost all software is kept in-house, meaning that you’re responsible for the email server, local machine software, and instant messenger. None of the company’s services are kept on the cloud.

Customer data is stored on a single file server. When a new salesperson starts, you also map this file server onto their local machine, so that they can access it like a directory. Whoever creates a folder on this server owns that folder and everything in it. There are no backups to this critical customer data. If a user deletes something, it may be lost for everyone.

The company generates a lot of revenue and is rapidly growing. They’re expecting to hire hundreds of new employees in the next year or so, and you may not be able to scale your operations at the pace you’re working.

**answer by chatGTP-4o** :  
W.D. Widgets is a rapidly growing company with a current IT infrastructure that is not scalable or resilient enough to meet its future needs. As the sole IT administrator, your role is crucial, but the current setup may soon become overwhelming as the company expands. Below are five process improvements that would significantly enhance efficiency, scalability, and security.

Implement Automated Deployment and Configuration Management:
Manually installing sales-specific applications on each new machine is time-consuming and prone to errors. Implementing a configuration management tool like Microsoft Endpoint Configuration Manager (formerly SCCM) or Intune can automate the deployment of applications, updates, and security patches across all machines. This will reduce the setup time for new employees and ensure that all devices are consistently configured, freeing up your time for more strategic tasks.

Migrate Email and Collaboration Tools to the Cloud:
Managing an in-house email server and instant messenger is resource-intensive and risky, especially as the company grows. Migrating to a cloud-based solution like Microsoft 365 or Google Workspace would provide scalable email and collaboration tools with built-in security, backups, and disaster recovery. This transition would reduce the maintenance burden and improve reliability and accessibility for remote workers.

Implement a Centralized Backup Solution:
The current lack of backups for critical customer data is a significant risk. Implementing a robust backup solution, such as Veeam or Azure Backup, would ensure that all data stored on the file server is regularly backed up and can be quickly restored in case of accidental deletion or hardware failure. This would safeguard the company’s valuable data and provide peace of mind.

Enhance User Access Management:
Currently, the ownership and management of folders on the file server are decentralized, which can lead to data silos and security risks. Implementing a more structured access control policy using Active Directory group policies would ensure that data is accessible to those who need it while protecting sensitive information. This change would also streamline onboarding processes, making it easier to provision new employees with the appropriate access.

Establish a Help Desk Ticketing System:
As the company grows, managing IT requests via email will become unmanageable. Implementing a help desk ticketing system, such as Jira Service Desk or Zendesk, would allow for better tracking and prioritization of IT issues. This system would also provide a knowledge base for common problems, reducing the number of repeat requests and improving response times.

# Scenario 3  
You’re doing systems administration work for Dewgood. Evaluate their current IT infrastructure needs and limitations, then provide at least five process improvements and rationale behind those improvements. Please write a 200-400 word process review for this consultation. Remember, there’s no right or wrong answer, but make sure to provide your reasoning.  

**Non-profit Company** :  
Dewgood is a small, local non-profit company of 50 employees. They hired you as the sole IT person in the company. The HR person tells you when they need a new computer for an employee. Currently, computers are purchased directly in a physical store on the day that an employee is hired. This is due to budget reasons, as they can’t keep extra stock in the store.

The company has a single server with multiple services on it, a file server, and email. They don’t currently have a messaging system in place. When a new employee is hired, you have to do an orientation with them for login. You’re also responsible for installing all the software they need on their machine, and mapping the file server to their computer. The computers are managed through Windows Active Directory. When an employee leaves, they’re currently not disabled in the directory service.

The company uses an open-source ticketing system to handle all internal requests as well as external non-profit requests. But the ticketing system is confusing and difficult to use, so lots of the employees reach out to you directly to figure out how to do things. In fact, so many things are difficult to find that employees typically ask around when they have a question.

There are nightly backups in place of the file server. You store this information on a disk backup and take it home with you everyday to keep it safe in case something happens onsite. There’s also a small company website that’s hosted on the single server at the company. This website is a single html page that explains the mission of the company and provides contact information. The website has gone down many times, and no one knows what to do when it happens.  

**answer by chatGTP-4o** :  
Dewgood, a small non-profit with 50 employees, currently faces several IT infrastructure challenges due to its limited resources and the sole responsibility of one IT staff member. Here’s a review of the current setup and suggested improvements:

Current Needs and Limitations:

Procurement Process: Computers are purchased on-demand, which can delay setup and cause disruptions.
Server Overload: A single server hosts multiple critical services including file storage, email, and the company website, increasing the risk of downtime.
User Management: Lack of automation in onboarding and offboarding processes.
Ticketing System: The current ticketing system is confusing, leading to inefficient support and frequent direct requests to the IT staff.
Backup Strategy: Manual backup handling poses a risk of data loss.
Process Improvements:

Implement a Standardized Computer Procurement Process: Establish a plan to purchase and pre-configure computers in advance. This involves setting aside a small budget for a few extra computers that can be deployed immediately when needed. This will streamline the onboarding process and reduce downtime for new hires.

Rationale: Pre-configured computers can be set up with necessary software and configurations ahead of time, minimizing delays and improving productivity.

Deploy a Dedicated Server for Each Service: Split the current server’s roles by deploying separate servers for file storage, email, and the company website. Consider cloud-based services or virtual servers to handle the website and email, reducing the risk associated with a single point of failure.

Rationale: Distributing services across multiple servers or cloud solutions will enhance reliability, reduce downtime, and improve performance.

Automate User Management: Integrate an automated system for managing user accounts in Active Directory. Implement scripts or tools that automatically disable accounts upon employee departure and streamline the onboarding process with pre-configured user profiles.

Rationale: Automation reduces manual errors, ensures timely access and security updates, and saves administrative time.

Upgrade the Ticketing System: Evaluate and replace the current ticketing system with a more user-friendly solution. Implement training sessions for employees on how to use the new system effectively and ensure it is accessible for both internal and external requests.

Rationale: A more intuitive ticketing system will improve user experience, reduce direct IT queries, and enhance overall efficiency in handling requests.

Enhance Backup and Recovery Procedures: Move to a cloud-based backup solution for the file server and website. Automate backup schedules and implement a disaster recovery plan that includes regular testing of backups.

Rationale: Cloud backups offer increased reliability, ease of access, and protection against onsite failures. Automation and regular testing will ensure data integrity and quicker recovery.  