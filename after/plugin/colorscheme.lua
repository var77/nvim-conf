-- color scheme and lua-line
require("material.util").load()
require("material").setup(
  {
    material_style = "oceanic",
    material_italic_comments = true,
    material_italic_keywords = true,
    material_italic_functions = true,
    material_italic_variables = false,
    material_contrast = true,
    material_borders = false,
    material_disable_background = false
  }
)

require("lualine").setup {
  options = {
    theme = "material-nvim"
  }
}
