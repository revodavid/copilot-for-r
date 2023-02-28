# Clone this repository
```
git clone https://github.com/revodavid/copilot-for-r
```

# Prepare your environment

Install Visual Studio Code and R

In VS code:
- Install Copilot extension
- Install R Extension for Visual Studio Code
- To focus on copilot suggestions, change these settings:
  - Editor > Hover (disabled)
  - Editor > Quick Suggestions (off)
  - Editor > Parameter Hints (disabled)

In R:
 - Install packages: httr, jsonlite, tidyverse, tidymodels, docopt, httpuv
 - options(vsc.dev.args = list(width = 800, height = 600)) # for better plots
  
 In root folder of repo:
  - Create the file openai_key.txt containing only your OpenAI API key 
    - In Azure OpenAI Service, click on "Keys and Endpoint" and copy the key


# Demo: Analysis of pumpkins data

1. Open pumpkins.R and delete the contents. You can print it out or display it in an unsaved window to help you, but if you leave the contents in a file Copilot will use it to suggest its prompts, which is cheating.


# Azuere OpenAI API Service demo
Open the file openai-sample-script.R and run the R code.

