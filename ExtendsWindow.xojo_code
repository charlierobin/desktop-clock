#tag Module
Protected Module ExtendsWindow
	#tag Method, Flags = &h0
		Sub invalidateShadow(extends wind As Window)
		  if wind = nil then return
		  
		  const CocoaLib = "Cocoa"
		  
		  soft declare sub invalidateShadow lib CocoaLib selector "invalidateShadow" ( NSWindow As Integer )
		  
		  invalidateShadow( wind.Handle )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeWindowTransparent(extends wind As Window, forceDisplay As boolean = false)
		  if wind = nil then return
		  
		  const CocoaLib = "Cocoa"
		  
		  soft declare function NSClassFromString lib CocoaLib (aClassName as CFStringRef) as Ptr
		  soft declare function colorMaker lib CocoaLib selector "colorWithCalibratedWhite:alpha:" (NSColorClass As Ptr, white As Single, alpha As Single) As Ptr
		  soft declare sub setBGColor lib CocoaLib selector "setBackgroundColor:" (NSWindow As Ptr, backgroundColor As Ptr)
		  soft declare sub setOpaque lib CocoaLib selector "setOpaque:" (NSWindow As Ptr, flag As Byte)
		  
		  dim w As Ptr = Ptr(wind.Handle)
		  
		  var off as Integer = 0
		  var on as Integer = 1
		  
		  setOpaque(w, off)
		  
		  setBGColor(w, colorMaker(NSClassFromString("NSColor"), 1, 0))
		  
		  if forceDisplay then
		    
		    soft declare sub invalidateShadow lib CocoaLib selector "invalidateShadow" (NSWindow As Ptr)
		    soft declare sub disp lib "AppKit" selector "display" (windRef As Ptr)
		    
		    disp(w)
		    invalidateShadow(w)
		    
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLevel(extends w as Window, value as Integer)
		  // Const NSNormalWindowLevel       = 0
		  // Const NSFloatingWindowLevel     = 3
		  // Const NSModalPanelWindowLevel   = 8
		  // Const NSDockWindowLevel         = 20
		  // Const NSMainMenuWindowLevel     = 24
		  // Const NSPopUpMenuWindowLevel    = 101
		  // Const NSScreenSaverWindowLevel  = 1001
		  
		  // -2147483648 : NSBaseWindowLevel (0)
		  // -2147483643 : NSMinimumWindowLevel (1)
		  // -2147483623 : NSDesktopWindowLevel (2)
		  // -2147483603 : NSDesktopIconWindowLevel (18)
		  // -20 : NSBackstopMenuLevel (3)
		  // 0 : NSNormalWindowLevel (4)
		  // 3 : NSFloatingWindowLevel (5)
		  // 3 : NSTornOffMenuWindowLevel (6)
		  // 8 : NSModalPanelWindowLevel (10)
		  // 19 : NSUtilityWindowLevel (17)
		  // 20 : NSDockWindowLevel (7)
		  // 24 : NSMainMenuWindowLevel (8)
		  // 25 : NSStatusWindowLevel (9)
		  // 101 : NSPopUpMenuWindowLevel (11)
		  // 102 : NSOverlayWindowLevel (15)
		  // 200 : NSHelpWindowLevel (16)
		  // 500 : NSDraggingWindowLevel (12)
		  // 1000 : NSScreenSaverWindowLevel (13)
		  // 1500 : NSAssistiveTechHighWindowLevel (20)
		  // 2147483630 : NSCursorWindowLevel (19)
		  // 2147483631 : NSMaximumWindowLevel (14)
		  
		  // https://gist.github.com/invariant/668e98c49ab05470eae2
		  
		  declare sub NSWindowSetLevel lib "Cocoa" selector "setLevel:" ( WindowRef as integer, Level as Integer )
		  
		  NSWindowSetLevel( w.Handle, value )
		  
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = NSDesktopWindowLevel, Type = Double, Dynamic = False, Default = \"-2147483623", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NSNormalWindowLevel, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
