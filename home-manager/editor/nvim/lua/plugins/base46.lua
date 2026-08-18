vim.pack.add({
  {
    src = "https://github.com/AvengeMedia/base46",
  },
}, {
  load = function(plug_data)
    -- 在插件加载时执行配置
    vim.cmd.packadd(plug_data.spec.name)

    -- 配置 base46
    require("base46").setup({
      transparency = true,
      set_background = true,
      term_colors = true,
      integrations = {
        bufferline = false,
      },
    })

    -- 加载主题
    vim.cmd.colorscheme("base46-matugen")
  end,
})
