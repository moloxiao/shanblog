+++
title = 'How to Fix Replicate Run Error Readablestream in Nextjs'
date = 2024-12-05T18:53:31+13:00
draft = false
tags = ["Replicate", "Nextjs"]
description = "Fix the error when using the Replicate Node.js client in a Next.js application to retrieve the URL response."
+++
![Using the Replicate Node.js client](/images/2024-12/screen-02.png)  
If you try to use Replicate's Node.js client follow by model pages, like this :  
```
const output = await replicate.run("black-forest-labs/flux-schnell", { input }); 
console.log(output[0]);
```
you will get result : 
```
ReadableStream { locked: false, state: 'readable', supportsBYOB: false }.
```

You need change to :  
```
const [output] = await replicate.run(model, { input });
console.log(output.url());
```
More information check [doc](https://github.com/replicate/replicate-javascript).