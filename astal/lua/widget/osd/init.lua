local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor
local bind = astal.bind
local Variable = astal.Variable
local timeout = astal.timeout
local Wp = astal.require("AstalWp")

local visible = Variable(false)

local set_timer = function() return timeout(2000, function () visible:set(false) end) end
local timer = set_timer()

local 


return function ()
  local speaker = Wp.get_default().audio.default_speaker

  return 
end
