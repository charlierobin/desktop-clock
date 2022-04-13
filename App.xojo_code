#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ShowAboutWindow.Text = "About " + me.Name
		  
		  WindowMain.Show()
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function DecreaseLookahead() As Boolean Handles DecreaseLookahead.Action
			WindowMain.daysLookAhead = WindowMain.daysLookAhead - 1
			
			return true
			
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function IncreaseLookahead() As Boolean Handles IncreaseLookahead.Action
			WindowMain.daysLookAhead = WindowMain.daysLookAhead + 1
			
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ShowAboutWindow() As Boolean Handles ShowAboutWindow.Action
			WindowAbout.Show()
			
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToggleColour() As Boolean Handles ToggleColour.Action
			if WindowMain.colour = Color.White then
			
			WindowMain.colour = Color.Black
			
			else
			
			WindowMain.colour = Color.White
			
			end if
			
			return true
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToggleWindowLevel() As Boolean Handles ToggleWindowLevel.Action
			if me.atDeskTopLevel then
			
			WindowMain.setLevel( NSNormalWindowLevel )
			
			me.atDeskTopLevel = false
			
			else
			
			WindowMain.setLevel( NSDesktopWindowLevel )
			
			me.atDeskTopLevel = true
			
			end if
			
			return true
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h21
		Private atDeskTopLevel As Boolean
	#tag EndProperty


	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
