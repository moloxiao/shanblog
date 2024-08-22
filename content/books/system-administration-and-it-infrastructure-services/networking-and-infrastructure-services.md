+++
title = "Network and infrastructure services"
weight =  3
date = 2024-08-21T11:30:43+12:00
+++
 We will cover what IT infrastructure services are and what their role is in system administration. We'll also learn about server operating systems, virtualization, network services, DNS for web services, and how to troubleshoot network services.  

 # Physical infrastructure services

  * Server Operating System
  * Virtuallization(There are two ways you can run your services, either on dedicated hardware or on a virtualized instance on a server)
  * Remote Access(the ability to connect to your infrastructure from anywhere in the world. A popular tool to access the CLI remotely is WinRM or Putty. RDP is also popular if you want to access the GUI remotely.)  


# Network Services

* FTP, SFTP, TFTP
* PXE(Preboot eXecution Environment, pre boot execution)  
* NTP(Network time protocol : it's used to keep the clock synchronized on machines connected to a network) 
* Intranets, Proxy Servers 
* DNS(DNS is what maps human understandable names to IP addresses). Methods of Mapping : Local Host File, Local DNS Server
* DHCP(Dynamic Host Configuration Protocol)


Network Support Services Revisited(a couple of network services essential for enhancing employee productivity, privacy, and security within a company's IT infrastructure) :  
* Intranets
* Proxy Servers 

# troubleshooting Network Services

Unable to Resolve a Hostname or Domain Name.  
   
Basic Troubleshooting :  
1. Always start by checking if your network connection is active, like pinging a reliable site like www.google.com.
2. If your connection is active but you still can't access a specific website, the issue might be with your DNS settings.
  
Using NSLOOKUP and Checking the Host File : 
1. Use the nslookup command to see what IP address your DNS server is assigning to the website name.
2. If nslookup shows the correct IP address but the website still doesn't load, your computer's host file might be redirecting the website to a wrong IP address. You can edit the host file to remove any incorrect entries.  

Importance of Isolation :  
1. DNS troubleshooting can be tricky, but remember to isolate each component. Systematically checking your network connection, DNS server response, and host file will help you pinpoint and fix the root cause of the problem.

# Managing System Services
Services are programs that run in the background without needing user interaction, providing essential functions like DNS, DHCP, and NTP.  
Managing Services :  
1. System administrators need to know how to start, stop, and check the logs of services to ensure they're running smoothly.
2. Services are typically configured to start automatically upon system boot and restart if they crash, but these settings can be adjusted as needed.

How to :  
* Managing Services in Linux
* Managing Services in Windows
* Configuring Services in Linux
* Configuring Services in Windows

# Configuring Network Services  

dnsmasq, a tool that can handle DNS, DHCP, TFTP, and PXE services, and explores its basic DNS caching functionality.  
Configuring DNS with Dnsmasq :  
* In smaller setups, dnsmasq can be used as a centralized solution for handling various network services.
* Once installed, dnsmasq automatically starts with basic DNS caching enabled. This means it can store DNS query results, speeding up subsequent requests for the same domain.
* While primarily a caching DNS server, dnsmasq can also act as an authoritative server for specific hostnames.
* By providing dnsmasq with a file listing hostnames and their corresponding IP addresses, it can directly resolve those names without forwarding the query to other DNS servers.

dnsmasq as a DHCP server :  
* A DHCP server is typically configured on a device with a static IP address on the network interface used to serve DHCP requests.
* In the simulation, a single machine simulates both the DHCP server (using the eth_srv interface) and a DHCP client (using the eth_cli interface).
* The dnsmasq configuration file (dhcp.config) specifies the interface to listen on (eth_srv), the domain name, default gateway, and DNS server information for clients.
* A DHCP range defines the pool of IP addresses the server can assign, and the lease time determines how long a client can use an assigned IP.