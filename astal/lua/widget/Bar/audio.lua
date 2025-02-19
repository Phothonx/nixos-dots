local astal = require("astal")
local bind = astal.bind
local Wp = astal.require("AstalWp")
local Widget = require("astal.gtk3.widget")
-- local Variable = astal.Variable

return function()
	local speaker = Wp.get_default().audio.default_speaker
	-- local scroll_revealed = Variable()

	return Widget.EventBox({
		-- on_hover = function()
		-- 	scroll_revealed:set(true)
		-- end,
		-- on_hover_lost = function()
		-- 	scroll_revealed:set(false)
		-- end,
		tooltip_text = bind(speaker, "volume"):as(function(v)
			return string.format("%.0f%%", v * 100)
		end),
		Widget.Box({
			Widget.Button({
        class_name = "Volume";
				on_click_release = function()
					speaker.mute = not speaker.mute
				end,
				Widget.Icon({
					class_name = "icon",
					icon = bind(speaker, "volume-icon"),
				}),
			}),
 -- 		Widget.GtkRevealer({
 -- 			reveal_child = scroll_revealed(),
 -- 			transition_type = "SLIDE_LEFT",
 -- 			valign = "CENTER",
 -- 			Widget.Slider({
 -- 				class_name = "volume-slider",
 -- 				on_dragged = function(self)
 -- 					speaker.volume = self.value
 -- 				end,
 -- 				hexpand = true,
 -- 				value = bind(speaker, "volume"),
 -- 			}),
 -- 		}),
		}),
	})
end
