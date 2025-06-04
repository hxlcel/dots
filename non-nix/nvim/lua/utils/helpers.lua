local M = {} -- A local module.

function M.get_env_python()
  --[[
  Returns the path of the active python environment.

  This function checks the current working directory (where neovim was
  opened from) and returns the path of the active python instance.

  Applicable environment is any systemwide instance when there is no
  active venv, dev environment, nix shell, etc.
  ]]
  return vim.fn.trim(vim.fn.system("which python3"))
end

return M -- returning the local module exposes all fields to calls of require("utils.helpers").
