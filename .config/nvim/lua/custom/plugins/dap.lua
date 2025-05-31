local function get_arguments()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = "Enter command-line arguments: " }, function(input)
        args = vim.split(input, " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = "Enter command-line arguments: " }, function(input)
      args = vim.split(input, " ")
    end)
    return args
  end
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function(_)
    local dap = require("dap")
    local ui = require("dapui")

    require("dap-go").setup({
      dap_configurations = {
        {
          type = "go",
          name = "Debug test w args",
          request = "launch",
          mode = "test",
          program = "${file}",
          args = get_arguments,
        },
      },
    })
    require("dapui").setup()

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F10>", dap.terminate)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dl", dap.list_breakpoints)
    vim.keymap.set("n", "<leader>dc", dap.clear_breakpoints)
    vim.keymap.set("n", "<leader>?", function()
      ui.eval(nil, { enter = true })
    end)

    vim.api.nvim_create_user_command("Dap", function()
      require("dapui").toggle()
    end, {})

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
  end,
}

