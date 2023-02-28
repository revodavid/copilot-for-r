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


# Create a new R function with the help of Copilot

1. Create new empty file openai.R
2. Type: `openai <- function(prompt) {` and press tab.
   * It should insert a nice intro comment for you
3. Type: `# retrieve API key from file, and set to environment variable OPENAI_API_KEY:` and press TAB twice
   * It should insert two lines of code
   * NOTE: be sure to replace the API key in openai_key.txt with your own

