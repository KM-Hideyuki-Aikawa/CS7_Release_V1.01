Set ws = WScript.CreateObject("WScript.Shell")
Set args = WScript.Arguments
WScript.Echo ws.SpecialFolders(args(0))

