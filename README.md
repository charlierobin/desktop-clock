# Desktop Clock
 
A very simple clock showing date and time that can be set to the macOS desktop level, ie: it shows above your desktop picture but below Finder icons, app windows etc.

It started off very basic, and has stayed that way over the years. I wrote it simply because there wasn’t anything like it, and I knew what I wanted, with no frills.

![Screenshot](/screenshots/screenshot1.png)

I’ve tested it on Catalina, and on macOS Monterey.

On first run it will ask for permission to access your calendars.

The way in which it accesses calendars is pretty hacky. I always wanted to update it to use Event Kit, but the couple of times I’ve looked into that I’ve always run into some kind of security/Apple sand box issue, and so, until that whole little problem gets fixed, the hackiness remains.

If you don’t fancy compiling yourself and just wanted the prebuilt app, there’s a universal (Intel/ARM) binary available for download from here:

[Universal binary disk image](https://dl.dropboxusercontent.com/s/s8jz3gdcnt1h1fv/DesktopClock.dmg.zip?dl=0)

The app itself is very simple:

Command-T to toggle between “normal” window level and desktop level.

Command-C to toggle colour between white to black and back again, depending on your desktop picture and personal preferences.

Command-+ (plus) and command-- (minus) to increase/decrease the calendar events lookahead, ie: how many days into the future the upcoming events from your calendar are displayed.