#tag Module
Protected Module ExtendsApp
	#tag Method, Flags = &h0
		Function FullVersion(extends a as App) As String
		  return a.MajorVersion.ToString() + "." + a.MinorVersion.ToString() + "." + a.BugVersion.ToString() + "." + a.NonReleaseVersion.ToString()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(extends a as App) As String
		  var bits() as String = a.ExecutableFile.Name.Split( "." )
		  
		  return bits( 0 )
		  
		  
		End Function
	#tag EndMethod


End Module
#tag EndModule
