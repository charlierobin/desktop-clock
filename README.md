# Desktop Clock
 
A very simple clock showing date and time that can be set to the macOS desktop level, ie: it shows above your desktop picture but below Finder icons, app windows etc.

It started off very basic, and has stayed that way over the years. I wrote it simply because there wasn’t anything like it, and I knew what I wanted, with no frills.

![Screenshot](/screenshots/screenshot1.png)

I’ve tested it on Catalina, on Big Sur, and on macOS Monterey.

On first run it will ask for permission to access your calendars.

The way in which it accesses calendars is pretty hacky. I always wanted to update it to use Event Kit, but the couple of times I’ve looked into that I’ve always run into some kind of security/Apple sand box issue, and so, until that whole little problem gets fixed, the hackiness remains.

If you don’t fancy compiling yourself and just wanted the prebuilt app, there’s a universal (Intel/ARM) binary available for download from here:

[Desktop Clock universal binary disk image](https://dl.dropboxusercontent.com/s/s8jz3gdcnt1h1fv/DesktopClock.dmg.zip?dl=0)

The app itself is very simple:

`Command T` to toggle between “normal” window level and desktop level.

`Command C` to toggle colour between white to black and back again, depending on your desktop picture and personal preferences.

`Command +` (plus) and `command -` (minus) to increase/decrease the calendar events lookahead, ie: how many days into the future the upcoming events from your calendar are displayed.

As I’ve cleaned it up over the last day or so, a few ideas for improvements and new features have occurred to me, so as time allow, there will be some updates.

Among the more obvious bits would be:

1. Allowing the user to specify fonts, sizes, colours
2. Custom formats for date and time
3. Hiding/showing the seconds in the time
4. Custom colours, with `command T` cycling through them all
5. Global keyboard shortcuts that work no matter what app you are using (ie: app doesn’t have to be active in order to get keyboard commands)
6. Running with no icon in the dock
7. An application icon ... **what kind of app doesn’t have its own icon**?

2024/12/17 - see also https://github.com/charlierobin/foretell

