focuswatch
==========

`focuswatch` is a program for macOS which logs to the console when focused application changes. I put it together in order to find out which application has been stealing focus from the front window for a fraction of a second. This has been happening a few times a day, at seemingly random times.

The code is derived from [this answer](https://stackoverflow.com/a/8348786/412655) on Stack Overflow


## Uage:

To build it:

```
make
```

To run it:

```
./focuswatch
```


The output looks something like this:

```
2020-12-29 16:42:29.749 focuswatch[94878:10978478] Current application:   450: Sublime Text - com.sublimetext.3 - file:///Applications/Sublime%20Text.app/
2020-12-29 16:42:33.437 focuswatch[94878:10978478] Current application:   449: Terminal - com.apple.Terminal - file:///System/Applications/Utilities/Terminal.app/
2020-12-29 16:42:36.829 focuswatch[94878:10978478] Current application: 99941: Google Chrome - com.google.Chrome - file:///Applications/Google%20Chrome.app/
2020-12-29 16:42:37.603 focuswatch[94878:10978478] Current application:   449: Terminal - com.apple.Terminal - file:///System/Applications/Utilities/Terminal.app/
```

## `focuscheck.py`

There is also a similar Python program, `focuscheck.py`, which works by polling every 0.1 seconds, instead of listening to application change events.

The code is from [this answer](https://apple.stackexchange.com/a/285090) on Stack Overflow.
