require("gp").setup({
  openai_api_key = os.getenv("OPENAI_API_KEY"),
  openai_api_base = "https://api.openai.com/v1",

  model = "gpt-4o-mini",
  default_chat_agent = "ChatGPT4o",
  chat_free_cursor = true,
  toggle_target = "split",
  openai_tools = { { type = "web_search" } },
})
