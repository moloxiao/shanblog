+++
title = 'Step by Step Deploy Strapi to Vercel'
date = 2024-07-19T11:15:27+12:00
draft = true
+++
This pages will guide you step by step deploy strapi to vercel.  

## STEP1 init github
1. create github project
![create github project](/images/step-by-step-deploy-strapi-vercel-01.png)
2. push an existing repository from the command line  
```
git init
git remote add origin git@github.com:moloxiao/cmsserver.git
git add .
git commit -m "init"
git push -u origin main
```




## FAQ 
### FAQ1 - git@github.com: Permission denied (publickey).
这个错误通常是因为您的SSH密钥未正确配置或没有正确的权限来访问您的GitHub仓库。
1. Check for Existing SSH Keys
Open your terminal and check for existing SSH keys:
```
ls -al ~/.ssh
```
You should see files named id_rsa and id_rsa.pub if SSH keys already exist. If you don't see these files, you'll need to generate a new SSH key.

2. (if needed)Generate a New SSH Key  
Generate a new SSH key:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Press Enter to save the key to the default location.  
Enter a passphrase (optional) and confirm it.  
  
Start the SSH agent and add your SSH key:
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
  
3. Add Your SSH Key to GitHub
Copy your SSH public key to the clipboard:  
```
cat ~/.ssh/id_rsa.pub
```
Copy the output (your SSH public key).  

4. Add the key to GitHub  
```
Log in to your GitHub account.  
Go to Settings > SSH and GPG keys.  
Click New SSH key.  
Paste your SSH public key into the "Key" field.  
Give your key a descriptive title and click Add SSH key.  
```
5.  Test the SSH Connection  
Test your SSH connection to GitHub:  
```
ssh -T git@github.com
```

You should see a message like:  
```
Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.
```

