require("gp").setup({
  providers = {
    anthropic = {
      endpoint = "https://api.anthropic.com/v1/messages",
      secret = os.getenv("ANTHROPIC_API_KEY"),
    },
  },

  agents = {
    {
      provider = "anthropic",
      name = "Claude",
      chat = true,
      command = true,
      model = { model = "claude-sonnet-4-20250514", max_tokens = 8192 },
      system_prompt = "You are a helpful AI assistant.",
    },
  },

  default_chat_agent = "Claude",
  chat_free_cursor = true,
  toggle_target = "split",
})
