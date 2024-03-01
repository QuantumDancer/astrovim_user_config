-- based on https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat.lua

local prompts = {
  -- Code related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  -- Text related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

local prefix = "<leader>j"
local maps = { n = {} }
local icon = vim.g.icons_enabled and " " or ""
maps.n[prefix] = { desc = icon .. "CopilotChat" }
require("astronvim.utils").set_mappings(maps)

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      -- prompts = prompts, -- Custom prompts
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      hide_system_prompt = "yes", -- Show user prompts only and hide system prompts.
      language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
    end,
    event = "VeryLazy",
    keys = {
      -- Show help actions with telescope
      {
        prefix .. "h",
        function()
          require("CopilotChat.code_actions").show_help_actions()
        end,
        desc = "Help actions",
      },
      -- Show prompts actions with telescope
      {
        prefix .."p",
        function()
          require("CopilotChat.code_actions").show_prompt_actions()
        end,
        desc = "Prompt actions",
      },
      {
        prefix .."p",
        ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
        mode = "x",
        desc = "Prompt actions",
      },
      -- Code related commands
      { prefix .."e", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
      { prefix .."t", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
      { prefix .."r", "<cmd>CopilotChatReview<cr>", desc = "Review code" },
      { prefix .."R", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code" },
      { prefix .."n", "<cmd>CopilotChatBetterNamings<cr>", desc = "Better Naming" },
      -- Chat with Copilot in visual mode
      {
        prefix .."v",
        ":CopilotChatVisual",
        mode = "x",
        desc = "Open in vertical split",
      },
      {
        prefix .."x",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "Run in-place code",
      },
       -- Custom input for CopilotChat
      {
        prefix .."i",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "Ask input",
      },
      -- Quick chat with Copilot
      {
        prefix .."q",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "Quick chat",
      },
      -- Debug
      { prefix .."d", "<cmd>CopilotChatDebugInfo<cr>", desc = "Debug Info" },
      -- Fix the issue with diagnostic
      { prefix .."f", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic" },
      -- Clear buffer and chat history
      { prefix .."l", "<cmd>CopilotChatReset<cr>", desc = "Clear buffer and chat history" },
      -- Toggle Copilot Chat Vsplit
      { prefix .."v", "<cmd>CopilotChatVsplitToggle<cr>", desc = "Toggle Vsplit" },
    },
  },
}
