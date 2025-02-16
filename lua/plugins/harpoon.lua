-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",  -- Harpoon plugin
  lazy = false,
  config = function()
    -- Harpoon setup
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
  end,
}
