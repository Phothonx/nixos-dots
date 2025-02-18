local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor
local bind = astal.bind

local Variable = astal.Variable
local timeout = astal.timeout

local Wp = astal.require("AstalWp")
local speaker = Wp.get_default().audio.default_speaker

local visible = Variable(false)
local set_timer = function () return timeout(2000, function () visible:set(false) end) end
local timer = set_timer()


return function ()
  return Widget.Window({
    name = "volume-osd",
    class_name = "volume-osd",
    anchor = Anchor.RIGHT,
    height_request = 350,
    width_request = 40,
    margin = 15,
    visible = bind(visible),
    Widget.LevelBar({
      margin = 5,
      vertical = true,
      inverted = true,
      max_value = 110,
      min_value = 0,
      value = bind(speaker, "volume"):as(function (v)
        timer:cancel()
        visible:set(true)
        timer = set_timer()
        return v*100
      end);
    })
  })
end
