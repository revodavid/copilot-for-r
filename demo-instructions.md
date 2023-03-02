# Clone this repository
```
git clone https://github.com/revodavid/copilot-for-r
```

# Prepare your environment

Install Visual Studio Code and R

In VS code:
- Install [Copilot extension](https://aka.ms/get-copilot)
- Install [R Extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r)
- To focus on copilot suggestions, change these settings:
  - Editor > Hover (disabled)
  - Editor > Quick Suggestions (off)
  - Editor > Parameter Hints (disabled)

In R:
 - Install packages: httr, jsonlite, tidyverse, tidymodels, docopt, httpuv
 - OPTIONAL: options(vsc.dev.args = list(width = 800, height = 600)) # for easier to read  plots
  
 In root folder of repo:
  - Create the file openai_key.txt containing only your OpenAI API key 
    - In Azure OpenAI Service, click on "Keys and Endpoint" and copy the key


# Demo: Analysis of pumpkins data

Open `pumpkins.R` and delete the contents. You can print it out or display it in an unsaved window to help you, but if you leave the contents in a file Copilot will use it to suggest its prompts.

Follow the path in the demo video "Copilot with R" linked in [Readme.md](Readme.md).

# Azure OpenAI API Service demo
You will need an Azure OpenAI API Service subscription. If you don't have one, visit the [Azure OpenAI Service product page](https://azure.microsoft.com/en-us/products/cognitive-services/openai-service/) and scroll to the section "How do I access Azure OpenAI Service?" near the bottom of the page.

If you have access to the OpenAI API Service, you can easily modify the script to use it.

Open the file `openai-sample-script.R` and run the R code.

Follow the path in the demo video "Azure OpenAI Service API" linked in [Readme.md](Readme.md).


