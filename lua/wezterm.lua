local M = {}

local directions = {
  h = "Left",
  l = "Right",
  j = "Down",
  k = "Up",
}

local arrows = {
  h = "left",
  l = "right",
  j = "down",
  k = "up",
}

local function command(args)
  os.execute("wezterm cli " .. args)
end

function M.navigate(direction)
  command("activate-pane-direction " .. directions[direction])
end

function M.go_direction(direction)
  local current_window = vim.fn.win_getid()
  vim.api.nvim_command("wincmd " .. direction)
  local at_edge = current_window == vim.fn.win_getid()
  if at_edge then
    M.navigate(direction)
  end
end

function M.keys()
  local keys = {}
  for key, _ in pairs(directions) do
    table.insert(keys, {
      "<c-" .. key .. ">",
      function()
        M.go_direction(key)
      end,
      mode = { "n" },
      desc = "Navigate " .. arrows[key],
    })
  end

  return keys
end

function M.setup(opts)
  for key, _ in pairs(directions) do
    vim.keymap.set("", "<c-" .. key .. ">", function()
      M.go_direction(key)
    end)
    -- support ctrl arrow keys in normal an insert mode
    vim.keymap.set({ "i", "n", "v", "x", "c" }, "<c-" .. arrows[key] .. ">", function()
      print("D" .. key)
      M.go_direction(key)
    end)
  end
end

return M
