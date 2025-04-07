+++
title = 'Designing and Delivering a Customizable Front-End UI System for End Users : 1'
date = 2025-04-07T15:10:00+13:00
draft = false
tags = ["SaaS", "Coding"] 
description = ""
+++

# 1 Delivery method

We have to choice for users:
* **Provide a project template**
* **Provide an import method that makes it easy to install into their existing project**

Inspired by [AdminMart](https://adminmart.com), we explored their approach to delivering UI systems via templates — including how they structure delivery, enable user customization, and support extensibility.  
The current analysis is based on the documentation of AdminMart and the templates provided by Material UI

# 2 Theme(Styling) & Customization
When you init a new project, you can choice :  
```
const initialState = {
    activeDir: 'ltr', 
    activeMode: 'light', // This can be light or dark
    activeTheme: 'BLUE_THEME', // BLUE_THEME, AQUA_THEME, GREEN_THEME, PURPLE_THEME, ORANGE_THEME, CYAN_THEME
    SidebarWidth: 270,
    MiniSidebarWidth: 87,
    TopbarHeight: 70,
    isLayout: 'boxed', // This can be full or boxed
    isCollapse: false, // to make sidebar Mini by default
    isSidebarHover: false,
    isMobileSidebar: false,
    isHorizontal: false,
    isLanguage: 'en',
    isCardShadow: true,
    borderRadius: 7,
  };
```

and you can customer : 
* colour
* Typography
* Icons
* shadow
* Customize Theme


# 3 Development
you need allow people make these things easy to do :  
* create new pages
* Multi Language
