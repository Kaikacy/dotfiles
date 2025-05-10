return {
      'HiPhish/rainbow-delimiters.nvim',
      event = { 'BufReadPost', 'BufNewFile' },
      config = function()
            require 'rainbow-delimiters'
            vim.g.rainbow_delimiters = {
                  query = {
                        lua = 'rainbow-blocks',
                        query = 'rainbow-blocks',
                  },
            }
      end,
}

