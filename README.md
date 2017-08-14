# Linkery

A browser-agnostic, MacOS-integrated link log, featuring a pleasing color scheme, a basic tagging system (one tag per link), search, sorting by date and title, and tag filtering. Looks something like this:

![Linkery screenshot](http://raphaelkabo.com/linkery.png)

## Requirements

- MacOS
- PHP, but only for the delete function - if anyone can teach me how to delete records from a CSV file without needing to run a PHP file, that would be great.

## Setup

1. Run the directory on a local server.
2. Copy the contents of `automator-service.applescript` into a new service created in Automator. You want it to receive no input in any application, and simply Run AppleScript. Make sure to change the directory to the location of Linkery (currently set as `/www/sites/links/`).
3. Assign your new service a keyboard shortcut in System Preferences > Keyboard > Shortcuts > Services. I use Cmd+\`.

When you press your shortcut, the service will activate and save the currently open tab in the frontmost browser to Linkery's CSV database (creating it if it is absent).

## Notes

Linkery currently works in all forms of Chrome and all forms of Safari, but not Opera or Firefox, because neither have reliable AppleScript support (see [here](https://gist.github.com/vitorgalvao/5392178)). Thank you also to the authors of that code.

