#SingleInstance, Force

Gui, -Caption
Gui, font, s22 cwhite

Gui, Add, Picture, x0 y0, titlebar2.png
Gui, Add, Text, x0 y0 w450 h40 +BackgroundTrans gUImove
Gui, Add, Picture, x458 y4 gclose +BackgroundTrans, Close Circle Buttons.png
Gui, Add, Picture, x0 y40, bg.png

Gui, Add, Text, x20 y83 +BackgroundTrans, Internet
Gui, Add, Picture, x310 y70 +BackgroundTrans vc1 gClick, button on 1.png
Gui, Add, Picture, x310 y70 +BackgroundTrans vc2 gClick hidden, button off 1.png

Gui, Add, Text, x20 y176 +BackgroundTrans, Sound
Gui, Add, Picture, x310 y160 +BackgroundTrans vx1 gClick1, button on 1.png
Gui, Add, Picture, x310 y160 +BackgroundTrans vx2 gClick1 hidden, button off 1.png

Gui, Add, Text, x20 y269 +BackgroundTrans, Microphone
Gui, Add, Picture, x310 y250 +BackgroundTrans vy1 gClick2, button on 1.png
Gui, Add, Picture, x310 y250 +BackgroundTrans vy2 gClick2 hidden, button off 1.png

Gui, Show, w500 h340

ci := 1, xi := 1, yi := 1

return


uiMove:
PostMessage, 0xA1, 2,,, A 
Return


Click:
	GuiControl Hide, c%ci%
	ci := 3 - ci
	GuiControl Show, c%ci%
	
	if (ci == 2)
		{
		ToolTip, Internet On
		}else{
		ToolTip, Internet Off
		}
		SetTimer, RemoveToolTip, 2000
Return



Click1:
	GuiControl Hide, x%xi%
	xi := 3 - xi
	GuiControl Show, x%xi%
	if (xi == 2)
		{
		ToolTip, Sound On
		}else{
		ToolTip, Sound Off
		}
		SetTimer, RemoveToolTip, 2000
Return



Click2:
	GuiControl Hide, y%yi%
	yi := 3 - yi
	GuiControl Show, y%yi%
	if (yi == 2)
		{
		ToolTip, Microphone On
		}else{
		ToolTip, Microphone Off
		}
		SetTimer, RemoveToolTip, 2000
Return

RemoveToolTip:
SetTimer, RemoveToolTip, off
ToolTip
return



close:
GuiEscape:
Exitapp