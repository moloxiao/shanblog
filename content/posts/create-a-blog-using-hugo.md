+++
title = 'Create a blog using Hugo'
date = 2024-07-02T20:57:29+12:00
draft = false
tags = ["Website Building", "Google Adsense", "Google Analytics", "Hugo"]
+++
Just like you see, this blog you are visiting is created using Hugo and hosted on GitHub Pages. In the process of using Hugo, I researched a lot to answer my questions. Here are some common issues.

## How to Create Pages and Posts with Hugo Commands
To create a new post in Hugo, you can use the following command:  
```
hugo new posts/your-post-title.md
```
For example, if you want to create a new post titled "my-first-post," you would run:  
```
hugo new posts/my-first-post.md
```
This command will create a file named my-first-post.md in the content/posts directory. The file will include predefined front matter, such as the title, date, and other metadata.

Ensure that your Hugo project structure contains the content/posts directory. If it doesn't, you can manually create the directory or adjust the command path according to your project's structure.

If you want to create a new page instead of a post, you can modify the command path. For example, to create a new page:  
```
hugo new about.md
```
This will create a file named about.md in the content directory.


## add google analytics

1. Update config.toml  
Open your config.toml file. Add the Google Analytics parameter:
```
[params]
  google_analytics = "G-XXXXXXXX"
```
2. Locate and Edit baseof.html  
Navigate to "themes/your-theme-name/layouts/_default/". 
Open baseof.html for editing :  
```
...

<head>
    {{- partial "head.html" . }}
    
    {{- partial "head.html" . }}
    {{ if .Site.Params.google_analytics }}
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ .Site.Params.google_analytics }}"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', '{{ .Site.Params.google_analytics }}');
    </script>
    {{ end }}
</head>
...
```
