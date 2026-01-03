local M = {}

local function preview()
  local filename = vim.fn.getbufinfo()[1].name
  local dirname = vim.fn.fnamemodify(filename, ":h")
  if filename:sub(-5) == ".yaml" then
    ---@diagnostic disable-next-line: undefined-field
    if vim.loop.os_uname().sysname == "Darwin" or vim.loop.os_uname().sysname == "macunix" then
      vim.fn.execute("write", 'silent')
      vim.fn.execute(
        "!ergogen " .. filename ..
        " -o " .. dirname .. "/ergogen-output",
        "silent"
      )
      vim.fn.execute("!open " .. dirname .. "/ergogen-output/points/demo.svg", 'silent')
    ---@diagnostic disable-next-line: undefined-field
    elseif vim.loop.os_uname().sysname == "unix" then
      vim.fn.execute("write", 'silent')
      vim.fn.execute(
        "!ergogen " .. filename ..
        " -o " .. dirname .. "/ergogen-output",
        "silent"
      )
      vim.fn.execute("!xdg-open " .. dirname .. "/ergogen-output/points/demo.svg", 'silent')
    else
      print("Unsupported OS")
    end
  else
    print(".yaml file not found. Ensure the yaml file is opened in the current buffer.")
  end
end

function M.setup()
  vim.api.nvim_create_user_command("Ergogen", function()
    preview()
  end, {})
end

return M
