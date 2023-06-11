# Alt-tab to previous window and send keyboard input
# Example of sending 25 thumbs-up emojis on the Signal Desktop app

# package which has keyboard emulation functionality, documentation here:
# https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys.sendwait
Add-Type -AssemblyName System.Windows.Forms
cls
start-sleep -seconds 1
[System.Windows.Forms.SendKeys]::SendWait("%({TAB})")

$iterations = 25
$delay = 200  # any faster can cause issues
# Can also use (get-random -minimum 200 -maximum 20000) or similar to have a random delay
$MESSAGE = ":+1:"

start-sleep -seconds 1

for ( $i = 0; $i -lt $iterations; $i++ )
{
	start-sleep -Milliseconds $delay
	[System.Windows.Forms.SendKeys]::SendWait("$MESSAGE")
	[System.Windows.Forms.SendKeys]::SendWait("~")
}

start-sleep -seconds 1
