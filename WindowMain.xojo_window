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
   Height          =   400
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
   Width           =   600
   Begin Timer Timer1
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
      Width           =   560
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
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  self.startX = X
		  
		  self.startY = Y
		  
		  self.lastX = X
		  
		  self.lastY = Y
		  
		  return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if self.lastX = X and self.lastY = Y then return
		  
		  self.lastX = X
		  
		  self.lastY = Y
		  
		  self.TrueWindow.Left = self.TrueWindow.Left + X - self.startX
		  
		  self.TrueWindow.Top = self.TrueWindow.Top + Y - self.startY
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.makeWindowTransparent()
		  
		  // self.setLevel( NSDesktopWindowLevel )
		  
		  self.timerMethod()
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub timerMethod()
		  self.LabelDate.Text = DateTime.Now().ToString( Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None )
		  
		  self.LabelTime.Text = DateTime.Now().ToString( Locale.Current, DateTime.FormatStyles.None, DateTime.FormatStyles.Medium )
		  
		  // self.LabelTime.Text = DateTime.Now().ToString( "yyyy.MM.dd G 'at' HH:mm:ss zzz" )
		  
		  self.invalidateShadow()
		  
		  // https://unicode.org/reports/tr35/tr35-4.html#Date_Format_Patterns
		  
		End Sub
	#tag EndMethod


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

#tag Events Timer1
	#tag Event
		Sub Action()
		  self.timerMethod()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
