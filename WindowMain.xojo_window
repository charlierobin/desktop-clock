#tag Window
Begin Window WindowMain
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   446
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1816473599
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Untitled"
   Type            =   4
   Visible         =   True
   Width           =   534
   Begin Timer TimerDateTime
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   100
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin Label LabelDate
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Arial Black"
      FontSize        =   32.0
      FontUnit        =   0
      Height          =   58
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Date"
      TextAlignment   =   2
      TextColor       =   &cFFFFFF00
      Tooltip         =   ""
      Top             =   27
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   494
   End
   Begin Label LabelTime
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Arial Black"
      FontSize        =   96.0
      FontUnit        =   0
      Height          =   192
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Time"
      TextAlignment   =   2
      TextColor       =   &cFFFFFF00
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   494
   End
   Begin Timer TimerCalendar
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   10000
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin Rectangle RectangleEventsArea
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   246
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   200
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   534
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  me.startX = X
		  
		  me.startY = Y
		  
		  me.lastX = X
		  
		  me.lastY = Y
		  
		  return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if me.lastX = X and me.lastY = Y then return
		  
		  me.lastX = X
		  
		  me.lastY = Y
		  
		  me.TrueWindow.Left = me.TrueWindow.Left + X - me.startX
		  
		  me.TrueWindow.Top = me.TrueWindow.Top + Y - me.startY
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.colour = Color.White
		  
		  me.ccStartY = me.RectangleEventsArea.Top
		  
		  me.RectangleEventsArea.Visible = false
		  
		  me.RectangleEventsArea.Enabled = false
		  
		  me.makeWindowTransparent()
		  
		  me.timerMethodForDateTime()
		  
		  me.timerMethodForCalendar()
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub clearEventsContainerControls()
		  for each cc as ContainerCalendarEntry in me.ccs
		    
		    cc.Close()
		    
		  next
		  
		  me.ccs.RemoveAllRows()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getEventsFromEventKit() As Dictionary()
		  // TEMP talking directly to Calendar file, very naughty ...
		  
		  // https://discussions.apple.com/thread/2008128
		  
		  var data() as Dictionary
		  
		  var f as FolderItem = SpecialFolder.UserLibrary.Child( "Calendars" ).Child( "Calendar Cache" )
		  
		  if f <> nil and f.Exists then
		    
		    var db as SQLiteDatabase = new SQLiteDatabase( f )
		    
		    if db.Connect then
		      
		      // date works in seconds from 1970, whereas iCal works from 2001for ZSTARTDATE, ZENDDATE, ZDUEDATE, etc
		      
		      // setting 0200 below allows for events that are all day, starting at 0000, but are in database as 0100 etc ... yes, it's a bodge (for now)
		      
		      var thisDay as DateTime = new DateTime( DateTime.Now().Year, DateTime.Now().Month, DateTime.Now().Day, 2, 0, 0 )
		      
		      var startRange as Double = thisDay.SecondsFrom1970
		      
		      var iCalStart as DateTime = new DateTime( 2001, 1, 1 )
		      
		      startRange = startRange - iCalStart.SecondsFrom1970
		      
		      var endRange as Double = startRange + ( ( 60 * 60 * 24 ) * me.daysLookAhead )
		      
		      var SQL as String = "select ZSTARTDATE, ZENDDATE, ZTITLE, ZNOTES, ZISALLDAY from ZCALENDARITEM where ZSTARTDATE >= ? and ZSTARTDATE <= ? order by ZSTARTDATE asc;"
		      
		      try
		        
		        var rs as RowSet = db.SelectSQL( SQL, startRange, endRange )
		        
		        for each row as DatabaseRow in rs
		          
		          var startValue as Double = row.Column( "ZSTARTDATE" ).DoubleValue
		          
		          startValue = startValue + iCalStart.SecondsFrom1970
		          
		          var endValue as Double = row.Column( "ZENDDATE" ).DoubleValue
		          
		          endValue = endValue + iCalStart.SecondsFrom1970
		          
		          var item as Dictionary = new Dictionary()
		          
		          item.Value( "start" ) = new DateTime( startValue )
		          
		          item.Value( "end" ) = new DateTime( endValue )
		          
		          item.Value( "title" ) = row.Column( "ZTITLE" ).StringValue
		          
		          item.Value( "notes" ) = row.Column( "ZNOTES" ).StringValue
		          
		          item.Value( "allDay" ) = if ( row.Column( "ZISALLDAY" ).IntegerValue = 1, true, false )
		          
		          data.Add( item )
		          
		        next
		        
		        rs.Close()
		        
		        db.Close()
		        
		      catch error as DatabaseException
		        
		        System.DebugLog( error.Message )
		        
		      end try
		      
		    end if
		    
		  end if
		  
		  return data
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub timerMethodForCalendar()
		  var data() as Dictionary = me.getEventsFromEventKit()
		  
		  
		  me.clearEventsContainerControls()
		  
		  var y as Integer = me.ccStartY
		  
		  for each item as Dictionary in data
		    
		    item.Value( "colour" ) = me.colour
		    
		    var newCC as ContainerCalendarEntry = new ContainerCalendarEntry( item )
		    
		    newCC.EmbedWithin( me, 0, y, me.Width )
		    
		    me.ccs.Add( newCC )
		    
		    y = y + newCC.Height + 10
		    
		  next
		  
		  
		  me.Height = y
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub timerMethodForDateTime()
		  me.LabelDate.TextColor = me.colour
		  
		  me.LabelTime.TextColor = me.colour
		  
		  me.LabelDate.Text = DateTime.Now().ToString( Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None )
		  
		  me.LabelTime.Text = DateTime.Now().ToString( Locale.Current, DateTime.FormatStyles.None, DateTime.FormatStyles.Medium )
		  
		  // me.LabelTime.Text = DateTime.Now().ToString( "yyyy.MM.dd G 'at' HH:mm:ss zzz" )
		  
		  me.invalidateShadow()
		  
		  // https://unicode.org/reports/tr35/tr35-4.html#Date_Format_Patterns
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ccs() As ContainerCalendarEntry
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ccStartY As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.colour_m
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.colour_m = value
			  
			  me.timerMethodForDateTime()
			  
			  me.timerMethodForCalendar()
			  
			  
			End Set
		#tag EndSetter
		colour As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private colour_m As Color
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.daysLookAhead_m
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value >= 0 then
			    
			    me.daysLookAhead_m = value
			    
			    me.timerMethodForCalendar()
			    
			  end if
			  
			  
			End Set
		#tag EndSetter
		daysLookAhead As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private daysLookAhead_m As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private startX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private startY As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events TimerDateTime
	#tag Event
		Sub Action()
		  self.timerMethodForDateTime()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimerCalendar
	#tag Event
		Sub Action()
		  self.timerMethodForCalendar()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="colour"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="daysLookAhead"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
