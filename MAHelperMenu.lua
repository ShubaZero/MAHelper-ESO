local MAH = MAHelper

function MAH.Menu(savedVars)

	local panelInfo = {
        type = 'panel',
        name = 'Maelstrom Arena Helper',
        displayName = 'Maelstrom Arena Helper',
        author = "|c9684B1Shuba00|r",
        version = MAH.Versione,
        registerForRefresh = true
    }
	
    LibAddonMenu2:RegisterAddonPanel(MAH.name .. "Options", panelInfo)
	
	local optionsData = {
			 [1] = {
			type = "submenu",
			name = "Arrow Options",
			tooltip = "My submenu tooltip",	--(optional)
			controls = {
				[1] = {
					type = "checkbox",
					name = "MyArrowCheckBox",
					getFunc = function() return savedVars.ArrowV end,
					setFunc = function(value) savedVars.ArrowV = value end,
				},
				[2] = {
					type = "colorpicker",
					name = "My Color Picker",
					tooltip = "Color Picker's tooltip text.",
					getFunc = function() return unpack(savedVars.arrowColorArr[1]) end,	--(alpha is optional)
					setFunc = function(r,g,b,a) MAHelper.UpdateArrowColor(r,g,b,a) end,	--(alpha is optional)
				},
				[3] = {
					type = "slider",
					name = "SliderArrow",
					getFunc = function()  return savedVars.arrowScale * 100 end,
					setFunc = function(value) MAHelper.UpdateArrowScale(value)  end,
					default = savedVars.arrowScale * 100,
					min = 50,
					max = 120,
					reference = "MyAddonSlider"
				},
			},
		},
		[2] = {
        type = "submenu",
			name = "Icon Options",
			tooltip = "My submenu tooltip",	--(optional)
			controls = {
				[1] = {
					type = "checkbox",
					name = "MyIconCheckBox",
					getFunc = function() return savedVars.vIcon end,
					setFunc = function(value) savedVars.vIcon = value end,
				},
				[2] = {
					type = "slider",
					name = "SliderIcon",
					getFunc = function()  return savedVars.size end,
					setFunc = function(value) MAHelper.UpdateIconSize(value)  end,
					default = savedVars.size,
					min = 70,
					max = 150,
					reference = "SliderIconMAH"
				},
			},
		},
	 	[3] = {
        	type = "submenu",
			name = "Text Options",
			controls = {
				[1] ={
					type = "checkbox",
					name = "Change Text Position",
					getFunc = function() return savedVars.tv end,
					setFunc = function(value) MAHelper.ChangeVisText(value) end,
					default = false,
					width = "half",	--or "full" (optional)
				},
				[2] = 	 {
					type = "button",
					name = "Restore Position",
					tooltip = "Restore Text Position",
					func = function() MAHelper.ButtonTry() end,
					width = "half",	--or "full" (optional)
				},
			},
		},
		[4] = 	 {
				 type = "button",
				 name = "Try me!",
				 tooltip = "Try arrow and icon.",
				 func = function() MAHelper.ButtonTry() end,
				 width = "half",	--or "full" (optional)
			 },
	 }
    

	LibAddonMenu2:RegisterOptionControls(MAH.name .. "Options", optionsData)
end 