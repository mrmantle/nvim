return {
  url = 'https://codeberg.org/mmantle/dotnet.nvim',
  name = 'dotnet',
  ft = 'cs',
  ---@module 'dotnet'
  ---@type DotnetOptions
  opts = {
    telescope_file_browser_mappings_insert_dotnet_new = '<M-n>',
    telescope_file_browser_mappings_normal_dotnet_new = 'n',
    dotnet_templates_exclude_list = {},
  },
}
