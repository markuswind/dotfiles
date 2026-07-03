lua << EOF
require('nvim-tree').setup({
  hijack_netrw = true,
  hijack_directories = { enable = true },  -- opens tree on `nvim .`
  view = { width = 40 },
  filters = { custom = { '^\\.git$', '^\\.DS_Store$' } },
  renderer = {
    icons = {
      show = { file = false, folder = false, folder_arrow = false, git = false },
    },
  },
})
EOF

" Keep the :VE command muscle-memory.
if !exists(':VE')
  command VE NvimTreeToggle
endif
