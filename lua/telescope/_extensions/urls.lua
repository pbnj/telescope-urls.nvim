local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")

local url_finder = function()
  local pattern = "https?://[A-Za-z0-9_%-/.#%%=?&'@]+"
  local buffer_contents = vim.fn.join(vim.fn.getline(1, '$'), '\n')
  local urls_found = {}
  for url in string.gmatch(buffer_contents, pattern) do
    table.insert(urls_found, url)
  end
  return urls_found
end

local urls = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "URLs",
    finder = finders.new_table({
      results = url_finder()
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local opener = ""
        if vim.fn.has("macunix") == 1 then
          opener = "open"
        elseif vim.fn.has("linux") == 1 then
          opener = "xdg-open"
        end
        local openCommand = string.format("%s '%s' >/dev/null 2>&1", opener,
          selection[1])
        vim.fn.system(openCommand)
      end)
      return true
    end,
  }):find()
end

return require("telescope").register_extension {
  setup = function(ext_config, config) end,
  exports = { urls = urls },
}
