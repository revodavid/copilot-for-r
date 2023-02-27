library(httr2)

##
## Update the values below to match your OpenAI deployment
##

OPENAI_KEY <- readLines("openai_key.txt")
Sys.setenv(OPENAI_API_KEY = OPENAI_KEY)

ENDPOINT <- "https://openai-test-20230120.openai.azure.com/"
DEPLOYMENT <- "text-davinci-003"

##
## Manually generate a response via the OpenAI API
##

req <- request(ENDPOINT) %>%
  req_url_path_append("openai/deployments") %>%
  req_url_path_append(DEPLOYMENT) %>%
  req_url_path_append("completions") %>%
  req_url_query("api-version"="2022-12-01")

payload <- '{
  "prompt": "Hello world",
  "max_tokens": 100,
  "temperature": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0,
  "top_p": 0.5,
  "best_of": 1,
  "stop": null
}'

req <- req %>%
  req_headers(
    `api-key` = Sys.getenv("OPENAI_API_KEY"),
  ) %>%
  req_body_raw(payload, "application/json")

result <- req %>% req_perform()
result %>% resp_body_json() -> completion
cat(completion$choices[[1]]$text,"\n")

# use the openai functon to automate the process
source("openai.R")

# basic usage with text-davinci-003
openai("Tell me a joke")
openai("Tell me a dad joke")

# Results are non-deterministic, and not necessarily factual
openai("What is the date today?")
openai("What is the date today?")

# Exploring Codex, as used by Copilot
openai("fibonacci <- function (n)", model="code-davinci-002")
openai("# read data from file", model="code-davinci-002")
openai("# read data from file\ndata <- ", model="code-davinci-002")
openai("# read data from file penguins.csv\ndata <- ", model="code-davinci-002")

# davinci3 is more powerful than davinci2, which is more powerful than curie
openai("Write a limerick about the python language", model="text-davinci-003")
openai("Write a limerick about the python language", model="text-davinci-002")
openai("Write a limerick about the python language", model="text-curie-001")

# exploring token generation
openai("An unusual cat name is:", model="text-davinci-002")
openai("An unusual cat name is:", model="text-davinci-002", max_tokens=1)
openai("An unusual cat name is:", model="text-davinci-002", max_tokens=2)
openai("An unusual cat name is:", model="text-davinci-002", max_tokens=3)
openai("An unusual cat name is:", model="text-davinci-002", max_tokens=4)

# add tokens back to the prompt and regenerate
newprompt <- "An unusually long name for a cat is: P"
for (i in 1:10) {
  completion <- openai(newprompt, 
                      model="text-davinci-002", 
                      max_tokens=1, 
                      print.it=FALSE)
  newprompt <- paste0(newprompt, completion)
  print(newprompt)
}


openai("Respond with two words: a forename and a surname. An unusual baby name is:", model="text-davinci-003")

