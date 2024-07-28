+++
title = 'Creating Custom Code Snippets in Vscode'
date = 2024-07-23T11:49:42+12:00
draft = false
+++

VSCode provides a powerful snippet feature that helps developers boost their coding efficiency and consistency. This blog will guide you through creating custom code snippets in VSCode, specifically for TypeScript and React projects.   

## What are Code Snippets?

Code snippets are predefined chunks of code that you can quickly insert into your code files using simple shortcuts. They are extremely useful for repetitive tasks or commonly used code templates.  


## Steps to Manually Create Custom Code Snippets
1. Open VSCode Settings

First, open VSCode and press Cmd + Shift + P (Mac) or Ctrl + Shift + P (Windows/Linux) to open the command palette. Type Preferences: Configure User Snippets and select it.

2. Select File Type

In the list that appears, choose typescriptreact.json. If this file doesn’t exist, VSCode will automatically create it for you.

3. Add Custom Code Snippet

In the opened typescriptreact.json file, add your desired code snippet. Below is an example snippet for creating a React functional component in TypeScript:  
```
{
  "React Arrow Function Component Export (TypeScript)": {
    "prefix": "rafce",
    "body": [
      "import React from 'react';",
      "",
      "const ${1:${TM_FILENAME_BASE}}: React.FC = () => {",
      "  return (",
      "    <div>$1</div>",
      "  );",
      "};",
      "",
      "export default $1;"
    ],
    "description": "Create a React functional component with export using TypeScript"
  }
}

```  
Snippet Explanation :  
* prefix: The shortcut for the snippet. Typing rafce in a .tsx file and pressing Tab will trigger this snippet.
* body: The content of the snippet. ${1:${TM_FILENAME_BASE}} automatically inserts the current file name (without extension) as the default component name.
* description: A description of the snippet, which appears in the snippet selection list.  
* Automatic Filename Insertion: ${TM_FILENAME_BASE} is a special variable that represents the current file name (without extension). This ensures that the component name matches the file name.
* Placeholders: ${1:...} and $1 are placeholders that allow the cursor to automatically jump to the corresponding position after the snippet is inserted, making further editing convenient.

## Using the Custom Code Snippet
Once the snippet is created, type rafce in a .tsx file and press Tab. The snippet will expand and generate the following code, using the current file name as the default component name:  
```
import React from 'react';

const FileName: React.FC = () => {
  return (
    <div>FileName</div>
  );
};

export default FileName;

```  

## Conclusion  
Manually creating custom code snippets is a powerful feature in VSCode that can significantly enhance your development efficiency and code consistency. With simple configuration, you can create various snippets tailored to your needs for different programming languages and frameworks.

Whether you are a beginner or an experienced developer, leveraging the snippet feature can make your coding experience smoother and more efficient. Try it out in your project today!