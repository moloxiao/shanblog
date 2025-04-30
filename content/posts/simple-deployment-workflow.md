+++
title = 'Simple Delpoyment Workflow'
date = 2025-04-30T20:00:01+13:00
draft = false
tags = ["DevOps", "Git"]
description = "Simple delpoyment workflow with git."
+++
[Vercel](https://vercel.com/) and similar platforms have dramatically lowered the complexity of deploying web applications. For many individual developers or simple projects, sophisticated CI/CD pipelines and branching strategies may be overkill.

In this blog post, we'll walk through a **lightweight Git-based deployment workflow** that's easy to manage, beginner-friendly, and perfectly suited for small- to medium-sized projects.

---

##  1. Workflow Overview

This workflow assumes you're using Vercel and Git (either via CLI or VS Code). The idea is to:

- Use **only the `main` branch to trigger production deployments**
- Do daily development in a temporary `developer` branch
- Merge into `main` once a development cycle is completed and tested
- Repeat the process in the next cycle

**Why this works well:**

- Avoids frequent preview deployments
- Keeps your production deployments clean and controlled
- No need to configure GitHub Actions or Vercel CLI

---

##  2. Step-by-Step Workflow (Git CLI vs. VS Code)

| Step | Goal                         | Git Command Line                                          | VS Code Source Control                                     |
|------|------------------------------|-----------------------------------------------------------|------------------------------------------------------------|
| 1    | Pull the latest main branch  | `git checkout main`<br>`git pull origin main`            | SCM Panel → ... menu → `Checkout to...` → Select `main`, then `Pull` |
| 2    | Start a new developer branch | `git checkout -b developer`                               | SCM Panel → ... menu → `Create new branch` → Name `developer` |
| 3    | Write code & commit          | `git add .`<br>`git commit -m "feat: xxx"`                | Stage changes with `+` button → Add commit message → Click ✓ |
| 4    | Push the dev branch          | `git push origin developer`                               | Click “Publish Branch” or “Push” button in bottom bar      |
| 5    | Test the feature locally     | (Manual testing)                                          | (Manual testing)                                           |
| 6    | Merge to main                | `git checkout main`<br>`git merge developer`              | Checkout `main` in SCM → Click `Merge into main`           |
| 7    | Push to main → deploy!       | `git push origin main`                                    | Click “Push” on main branch                                |
| 8    | Delete the developer branch  | `git branch -d developer`<br>`git push origin --delete developer` | SCM Panel → ... menu → Delete Branch (local & remote)     |

---


## 3. Example - Git Workflow Using VSCode Source Control
Prerequisites :  
- You have a Git repository initialized.
- You are currently on the `main` branch.

| Phase | Step | Description | VSCode Action |
|-------|------|-------------|----------------|
| **1. Create Branch** | 1.1 | Make sure you are on the `main` branch | Click bottom-left branch name → select `main` |
|                       | 1.2 | Create `developer` branch | Click branch name → `Create new branch...` → name it `developer` |
|                       | 1.3 | Automatically switch to `developer` | VSCode switches branch after creation |
| **2. Daily Commit**   | 2.1 | Make code changes | Edit your files in VSCode |
|                       | 2.2 | View file changes | Click Source Control (Git icon in sidebar) |
|                       | 2.3 | Add a commit message | Enter a message like `Added user login` |
|                       | 2.4 | Commit changes | Click ✔️ checkmark |
|                       | 2.5 | (Optional) Push to remote | Click `Sync Changes` |
| **3. Merge to `main`**| 3.1 | Switch to `main` | Click branch name → choose `main` |
|                       | 3.2 | Merge from `developer` | Click branch name → `Merge Branch...` → select `developer` |
|                       | 3.3 | Handle merge commit | Commit if prompted |
|                       | 3.4 | Push merged `main` | Click `Sync Changes` |
| **4. Clean Branch**   | 4.1 | Delete old `developer` branch | Terminal: `git branch -d developer` |
|                       | 4.2 | Delete remote branch (if needed) | Terminal: `git push origin --delete developer` |
|                       | 4.3 | Recreate from updated `main` | Terminal: `git checkout main` → `git pull` → `git checkout -b developer` |
|                       | 4.4 | Push new `developer` branch | Terminal: `git push -u origin developer` |

Summary :  

- Use a **fresh developer branch** each phase to keep history clean
- Merge only after confirming a completed phase
- Always start a new phase by creating `developer` from the latest `main`

##  4. Summary

This lightweight Git-based workflow is ideal for solo developers and small teams using platforms like Vercel. Here's what makes it work:

- You only deploy from `main`, which keeps your live site safe and stable.
- You isolate day-to-day development in a temporary `developer` branch.
- You don’t need GitHub Actions or Vercel CLI for this setup.
- You gain a clean, repeatable, and understandable development rhythm.

You can always upgrade this workflow later with feature branches, GitHub Actions, or CI checks as your project evolves.

---

**Happy coding!** 
