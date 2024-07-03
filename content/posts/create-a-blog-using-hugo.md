+++
title = 'Create a blog using Hugo'
date = 2024-07-02T20:57:29+12:00
draft = false
+++
Just like you see, this blog you are visiting is created using Hugo and hosted on GitHub Pages. In the process of using Hugo, I researched a lot to answer my questions. Here are some common issues.

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
