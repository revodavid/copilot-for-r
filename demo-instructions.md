In VS code:
- Install Copilot extension
- Install R Extension for Visual Studio Code

In R:
 - Install httr package
 - Install openai package

 In root folder of repo:
  - Create the file openai_key.txt and add your OpenAI API key
    - In Azure OpenAI Service, click on "Keys and Endpoint" and copy the key

# Create a new R function with the help of Copilot

1. Create new empty file openai.R
2. Type: `openai <- function(prompt) {` and press tab.
   * It should insert a nice intro comment for you
3. Type: `# retrieve API key from file, and set to environment variable OPENAI_API_KEY:` and press TAB twice
   * It should insert two lines of code
   * NOTE: be sure to replace the API key in openai_key.txt with your own

