+++
title = 'Create a blog using Hugo'
date = 2024-07-02T20:57:29+12:00
draft = false
tags = ["Website Building", "Google Adsense", "Google Analytics", "Hugo", "SEO"]
description = "How I created my blog using Hugo and the tools I used."
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
visit [google analytics](https://analytics.google.com/) to generate Google Analytics parameter. 
1. Update config.toml  
Open your config.toml file. Add the Google Analytics parameter:
```
[params]
  google_analytics = "G-XXXXXXXX"
```
2. Locate and Edit baseof.html  
Navigate to "themes/your-theme-name/layouts/_default/". 
Open baseof.html for editing :  
```html
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
```

## Configure Hugo to Generate a Sitemap
Hugo has built-in support for generating XML sitemaps. You just need to enable it in your configuration file.
Open your Hugo project’s configuration file config.toml(or config.yaml). Add or update the following configuration to enable the sitemap :  
```yaml
[outputs]
  home = ["HTML", "RSS", "SITEMAP"]

[sitemap]
  changefreq = "weekly"
  priority = 0.5
  filename = "sitemap.xml"
```
vist check :
```
http://127.0.0.1:1313/sitemap.xml
```

To optimize your Hugo-based blog for SEO using Google Search Console and Bing Webmaster Tools :  
* [Google Search Console](https://search.google.com/search-console)
* [Bing Webmaster Tools](https://www.bing.com/webmasters/)


## programmable search engine
I support blog search using Google [Programmable Search Engine, previously known as Google Custom Search](https://programmablesearchengine.google.com/).  

## add robots.txt

```
User-agent: *
Disallow: /tags/

Sitemap: https://moloxiao.github.io/sitemap.xml
```

## Build by github action
```
Start building sites … 
hugo v0.146.5-61328976e11cbb9d906b4a790b8a7cd25b2a914f linux/amd64 BuildDate=2025-04-15T17:54:38Z VendorInfo=gohugoio

WARN  Partial name "partials/templates/_funcs/get-page-images" starting with 'partials/' (as in {{ partial "partials/templates/_funcs/get-page-images"}}) is most likely not what you want. Before 0.146.0 we did a double lookup in this situation.
You can suppress this warning by adding the following to your site configuration:
ignoreLogs = ['warning-partial-superfluous-prefix']
ERROR render of "/" failed: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/_default/baseof.html:9:8": execute of template failed: template: list.html:9:8: executing "list.html" at <partial "head.html" .>: error calling partial: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/partials/head.html:13:15": execute of template failed: template: _partials/templates/opengraph.html:13:15: executing "partials/templates/opengraph.html" at <partial "partials/templates/_funcs/get-page-images" .>: error calling partial: partial "partials/templates/_funcs/get-page-images" not found
ERROR render of "/home/runner/work/shanblog/shanblog/content/books/modern-woodworking/_index.md" failed: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/_default/baseof.html:9:8": execute of template failed: template: list.html:9:8: executing "list.html" at <partial "head.html" .>: error calling partial: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/partials/head.html:13:15": execute of template failed: template: _partials/templates/opengraph.html:13:15: executing "partials/templates/opengraph.html" at <partial "partials/templates/_funcs/get-page-images" .>: error calling partial: partial "partials/templates/_funcs/get-page-images" not found
ERROR render of "/home/runner/work/shanblog/shanblog/content/books/modern-woodworking/common-woodworking-products.md" failed: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/_default/baseof.html:9:8": execute of template failed: template: single.html:9:8: executing "single.html" at <partial "head.html" .>: error calling partial: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/partials/head.html:13:15": execute of template failed: template: _partials/templates/opengraph.html:13:15: executing "partials/templates/opengraph.html" at <partial "partials/templates/_funcs/get-page-images" .>: error calling partial: partial "partials/templates/_funcs/get-page-images" not found
ERROR render of "/404" failed: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/_default/baseof.html:9:8": execute of template failed: template: 404.html:9:8: executing "404.html" at <partial "head.html" .>: error calling partial: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/partials/head.html:13:15": execute of template failed: template: _partials/templates/opengraph.html:13:15: executing "partials/templates/opengraph.html" at <partial "partials/templates/_funcs/get-page-images" .>: error calling partial: partial "partials/templates/_funcs/get-page-images" not found
Total in 112 ms
Error: error building site: render: failed to render pages: render of "/books" failed: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/_default/baseof.html:9:8": execute of template failed: template: list.html:9:8: executing "list.html" at <partial "head.html" .>: error calling partial: "/home/runner/work/shanblog/shanblog/themes/PaperMod/layouts/partials/head.html:13:15": execute of template failed: template: _partials/templates/opengraph.html:13:15: executing "partials/templates/opengraph.html" at <partial "partials/templates/_funcs/get-page-images" .>: error calling partial: partial "partials/templates/_funcs/get-page-images" not found
Error: Process completed with exit code 1.
```


# Changelog

* 2024-09-16  [Google AdSense](https://www.google.com/adsense) , **rejected**
* 2024-09-11 add robots.txt
* 2024-09-11 add google programmable search engine
* 2024-09-09 resubmit [Google AdSense](https://www.google.com/adsense)  
* 2024-09-09 add Bing Webmaster Tools 
* 2024-07-04 submit [Google AdSense](https://www.google.com/adsense) , **reject**
* 2024-07-02 add google search console
* 2024-07-02 add google analytics
* 2024-07-01 create blog
