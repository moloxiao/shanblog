+++
title = 'Minified React Error #130'
date = 2024-07-19T15:57:51+12:00
draft = false
tags = ["React", "Cloudflare", "Vite"]
description = "how to fix Minified React error #130"
+++
When I am unable to find an answer using ChatGPT, Gemini, claude, or Google, I believe it is necessary to document the steps I take to solve the problem.

The problem is :  
```
Unexpected Application Error!
Minified React error #130; visit https://reactjs.org/docs/error-decoder.html?invariant=130&args[]=undefined&args[]= for the full message or use the non-minified dev environment for full errors and additional helpful warnings.
Error: Minified React error #130; visit https://reactjs.org/docs/error-decoder.html?invariant=130&args[]=undefined&args[]= for the full message or use the non-minified dev environment for full errors and additional helpful warnings.
    at bl (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:49311)
    at d (https://12430492.xx.com/assets/index-D3_OKUgZ.js:38:7878)
    at v (https://12430492.xx.com/assets/index-D3_OKUgZ.js:38:9255)
    at S (https://12430492.xx.com/assets/index-D3_OKUgZ.js:38:11331)
    at Ft (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:1475)
    at Gd (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:3268)
    at P0 (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:2351)
    at Rm (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:1893)
    at K0 (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:47251)
    at H0 (https://12430492.xx.com/assets/index-D3_OKUgZ.js:40:39727)
```
There are no issues when developing my React application locally on my computer, but I encounter problems after deploying it to Cloudflare.

you can visit [Minified React error #130](https://react.dev/errors/130?invariant=130&args%5B%5D=undefined&args%5B%5D=) :  
```
Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: undefined.[missing argument]
```

This problem occurs because an object you are trying to use is undefine, like this :  
```
<RWebShare data={{ 
    title: `${resumeInfo.firstName} ${resumeInfo.lastName} resume`,
    }}>
        <Button>Share</Button>
</RWebShare>
```
If resumeInfo is null, the problem will occur, especially when data needs to be loaded asynchronously during initialization.  
Fix like this :  
```
<RWebShare data={{ 
    title: `${resumeInfo?.firstName} ${resumeInfo?.lastName} resume`,
    }}>
        <Button>Share</Button>
</RWebShare>
```
or like this :  
```
{resumeInfo && (
    <RWebShare data={{ 
        title: `${resumeInfo.firstName} ${resumeInfo.lastName} resume`,
        }}>
        <Button>Share</Button>
    </RWebShare>
)}
```