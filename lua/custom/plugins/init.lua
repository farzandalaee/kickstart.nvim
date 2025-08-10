-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
--
-- See the kickstart.nvim README for more information
return {
  -- GO Delve debugger
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'leoluz/nvim-dap-go',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        vim.notify('Debug terminated', vim.log.levels.ERROR, {
          title = 'Terminated',
        })
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<F10>', dap.step_over, {})
      vim.keymap.set('n', '<F11>', dap.step_into, {})
      vim.keymap.set('n', '<F23>', dap.step_out, {})
      vim.keymap.set('n', '<F5>', ':DapContinue<CR>', {})
      vim.keymap.set('n', '<F17>', ':DapTerminate<CR> :sleep 2<CR> :DapContinue<CR>', {})

      vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    end,
  },
  -- LazyGit
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
    },
  },
  -- vscode colorScheme
  {
    'Mofiqul/vscode.nvim',
  },
  -- notification
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require 'notify'
    end,
  },
  -- outline
  {
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
}
