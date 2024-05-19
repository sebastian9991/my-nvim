return {
  "numToStr/Comment.nvim",
  opts = {
    -- add any options here
  },
  lazy = false,
  config = function()
    require("Comment").setup()
    vim.keymap.set("n", "<Leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, {})

    -- in visual 'gc' to toggle comment 
  end,
}
