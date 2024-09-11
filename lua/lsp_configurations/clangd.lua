return {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    init_options = {
      fallback_flags = { '-std=c++17' },
    },
    single_file_support = true,
}

