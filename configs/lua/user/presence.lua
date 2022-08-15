local status_ok, presence = pcall(require, 'presence')
if not status_ok then
  return
end

presence:setup({
  auto_update = true,
  neovim_image_text = "The One True Text Editor",
  main_image = 'file', -- Either neovim or file
  --client_id = '',
  buttons = true,
  --buttons = {
  --  {
  --    label = 'Testing',
  --    url = 'https://google.com',
  --  },
  --},
  -- buttons = function(buffer, repo_url)
  --   local button = {
  --     label = 'Look at this fancy code!',
  --     url = repo_url,
  --   }

  --   if repo_url:match('presence.nvim') then
  --     button.label = 'Fancy presence plugin'
  --   elseif repo_url:match('dotfiles') then
  --     button.label = 'Linux ricing'
  --   end

  --   return { button }
  -- end,

  editing_text = 'Editing %s',
  file_explorer_text = 'Browsing %s',
  git_commit_text = 'Committing changes',
  plugin_manager_text = 'Managing plugins',
  reading_text = 'Reading %s',
  workspace_text = 'Working on %s',
  line_numer_text = 'Line %s out of %s',
})
