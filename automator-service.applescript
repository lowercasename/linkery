on FormatTime(AS_Date)
	return (do shell script "date -j -f '%A, %e %B %Y at %H:%M:%S' '" & AS_Date & "' '+%Y-%m-%dT%H:%M:%S%z'")
end FormatTime

on sanitiseCSV(input)
	return "\"" & input & "\""
end sanitiseCSV

tell application "System Events" to set frontApp to name of first process whose frontmost is true

if (frontApp = "Safari") or (frontApp = "Safari Technology Preview") or (frontApp = "Webkit") then
	using terms from application "Safari"
		tell application frontApp to set currentTabTitle to name of front document
		tell application frontApp to set currentTabUrl to URL of front document
	end using terms from
else if (frontApp = "Google Chrome") or (frontApp = "Google Chrome Canary") or (frontApp = "Chromium") then
	using terms from application "Google Chrome"
		tell application frontApp to set currentTabTitle to title of active tab of front window
		tell application frontApp to set currentTabUrl to URL of active tab of front window
	end using terms from
else
	return "You need a supported browser as your frontmost app"
end if

set currentTags to the text returned of (display dialog "Tag:" default answer "general")
set sanitisedTitle to "\"" & currentTabTitle & "\""
set cmd to "if [ ! -e '/www/sites/links/links.csv' ]; then
	echo 'timestamp,title,url,tag' >> /www/sites/links/links.csv;
	echo " & quoted form of sanitiseCSV(FormatTime(current date)) & "," & quoted form of sanitiseCSV(currentTabTitle) & "," & quoted form of sanitiseCSV(currentTabUrl) & "," & quoted form of sanitiseCSV(currentTags) & " >>  /www/sites/links/links.csv;
else
	echo " & quoted form of sanitiseCSV(FormatTime(current date)) & "," & quoted form of sanitiseCSV(currentTabTitle) & "," & quoted form of sanitiseCSV(currentTabUrl) & "," & quoted form of sanitiseCSV(currentTags) & " >>  /www/sites/links/links.csv;
fi"
do shell script (cmd)
