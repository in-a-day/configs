local M = {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-web-devicons" },
  event = { 'BufRead', 'BufNewFile' },

}

function M.config()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  local options = {
    options = {
      offsets = {
        { filetype = "NvimTree", text = "", padding = 1 },
        { filetype = "neo-tree", text = "Neo-Tree", padding = 1 },
        { filetype = "Outline", text = "Outline", padding = 1 },
        { filetype = "Trouble", text = "Trouble", padding = 1 },
      },
      separator_style = { '^', '^' },
      buffer_close_icon = "",
      show_buffer_close_icons = false,
      modified_icon = "",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_icons = true,
      always_show_bufferline = true,
      diagnostics = false,
    },
    -- highlights = {
    --   buffer_selected = {
    --     fg = '#000000',
    --     bg = '#986fec',
    --     bold = true,
    --     italic = true,
    --   },
    --   close_button = {
    --     fg = '#000000',
    --     bg = '#986fec',
    --   },
    --   -- close_button_visible = {
    --   --   fg = '#000000',
    --   --   bg = '#986fec',
    --   -- },
    -- },
  }

  bufferline.setup(options)
end

return M
