require("rvalle.dap.ui")
local ok, dap = pcall(require, "dap")

if not ok then
    return
end

local ok_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
if not ok_mason_dap then
    return
end

mason_dap.setup()

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin" .. "/OpenDebugAD7",
    -- command = "/home/rychardvalle/cpptools/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
    {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
    },
}
