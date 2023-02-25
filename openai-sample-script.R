library(httr2)

OPENAI_KEY <- readLines("openai_key.txt")
Sys.setenv(OPENAI_API_KEY = OPENAI_KEY)

ENDPOINT <- "https://openai-test-20230120.openai.azure.com/"
VERSION <- "2022-12-01"
DEPLOYMENT <- "text-davinci-002"

req <- request(ENDPOINT)
req %>%
  req_url_path_append("openai/deployments") %>%
  req_url_path_append(DEPLOYMENT) %>%
  req_url_path_append("completions") %>%
  req_url_query("api-version"="2022-12-01")

actual_endpoint <- "https://openai-test-20230120.openai.azure.com/openai/deployments/text-davinci-002/completions?api-version=2022-12-01" 
req
actual_endpoint

payload <- '{
  "prompt": "Tell me a joke",
  "max_tokens": 100,
  "temperature": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0,
  "top_p": 0.5,
  "best_of": 1,
  "stop": null
}'

req <- request(target_url) %>%
  req_headers(
    `api-key` = Sys.getenv("OPENAI_API_KEY"),
  ) %>% 
  req_body_raw(payload, "application/json") 

# req %>% req_dry_run()
result <- req %>% req_perform()
