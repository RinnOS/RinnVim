local status_ok, _ = pcall(require, 'mason')
if not status_ok then
  return
end

require('user/formatters/formatter-installer')
require('user/formatters/formatter')
