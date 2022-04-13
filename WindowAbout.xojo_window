#tag Window
Begin Window WindowAbout
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   284
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
   Type            =   0
   Visible         =   True
   Width           =   424
   Begin Label LabelName
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   24.0
      FontUnit        =   0
      Height          =   35
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   384
   End
   Begin Label LabelVersion
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   57
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   384
   End
   Begin Label LabelBlurb
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   92
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "A very simple desktop calendar display that I created for myself years ago because there was nothing else that worked quite the way I wanted it to.\n\nCharlie Robin 2015-2022"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   99
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   370
   End
   Begin LinkLabel LabelBuyMeCoffee
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "buymeacoffee.com/charliechuckles"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   "Click to open this link in your browser"
      Top             =   203
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   223
   End
   Begin LinkLabel LabelPayPal
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "paypal.me/charliechuckles"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   "Click to open this link in your browser"
      Top             =   235
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   169
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  me.Title = App.Name() + " (" + App.FullVersion() + ")"
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function Close() As Boolean Handles Close.Action
			me.Close()
			
			return true
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events LabelName
	#tag Event
		Sub Open()
		  me.Text = App.Name()
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LabelVersion
	#tag Event
		Sub Open()
		  me.Text = App.FullVersion()
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LabelBlurb
#tag EndEvents
