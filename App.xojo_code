#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  WindowMain.Show()
		  
		  // https://discussions.apple.com/thread/2008128
		  
		  var pathToDB as String = "/Users/charlie/Library/Calendars/Calendar Cache"
		  
		  var f as FolderItem = new FolderItem( pathToDB, FolderItem.PathModes.Native )
		  
		  If f.Exists Then
		    
		    var db as SQLiteDatabase = new SQLiteDatabase( f )
		    
		    if db.Connect then
		      
		      // date works in seconds from 1970, whereas iCal works from 2001
		      
		      var thisDay as DateTime = new DateTime( DateTime.Now().Year, DateTime.Now().Month, DateTime.Now().Day )
		      
		      var startRange as Double = thisDay.SecondsFrom1970
		      
		      var iCalStart as DateTime = new DateTime( 2001, 1, 1 )
		      
		      startRange = startRange - iCalStart.SecondsFrom1970
		      
		      var endRange as Double = startRange + ( ( 60 * 60 * 24 ) * 7 )
		      
		      var SQL as String = "select ZSTARTDATE, ZENDDATE, ZTITLE, ZNOTES from ZCALENDARITEM where ZSTARTDATE >= ? AND ZENDDATE <= ?;"
		      
		      // ZENDDATE, ZDUEDATE
		      
		      try
		        
		        var rs as RowSet = db.SelectSQL( SQL, startRange, endRange )
		        
		        for each row as DatabaseRow in rs
		          
		          System.DebugLog( row.Column( "ZTITLE" ).StringValue + if ( row.Column( "ZNOTES" ).StringValue <> "", ": ", "" ) + row.Column( "ZNOTES" ).StringValue )
		          
		        next
		        
		        rs.Close()
		        
		        db.Close()
		        
		      catch error as DatabaseException
		        
		        System.DebugLog( error.Message )
		        
		      end try
		      
		    end if
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


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


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

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
