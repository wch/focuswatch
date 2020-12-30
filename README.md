focuswatch
==========

`focuswatch` is a program for macOS which logs to the console when focused application changes. I put it together in order to find out which application has been stealing focus from the front window for a fraction of a second. This has been happening a few times a day, at seemingly random times.

The code is derived from [this answer](https://stackoverflow.com/a/8348786/412655) on Stack Overflow.


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
2020-12-29 17:34:22.927 focuswatch[95223:10988559] Current application: 99941: Google Chrome - com.google.Chrome - file:///Applications/Google%20Chrome.app/
2020-12-29 17:34:29.195 focuswatch[95223:10988559] Current application:   449: Terminal - com.apple.Terminal - file:///System/Applications/Utilities/Terminal.app/
2020-12-29 17:34:31.932 focuswatch[95223:10988559] Current application: 99941: Google Chrome - com.google.Chrome - file:///Applications/Google%20Chrome.app/
2020-12-29 17:41:32.068 focuswatch[95223:10988559] Current application: 96567: CUH - com.corel.CUH - file:///Library/Preferences/com.corel.CUH/CUH.app/
2020-12-29 17:41:32.187 focuswatch[95223:10988559] Current application: 99941: Google Chrome - com.google.Chrome - file:///Applications/Google%20Chrome.app/
```

In my case, it turned out that the culprit was `com.corel.CUH`, which is "Corel Update Helper", and was installed along with Corel Painter, which is an application that I tried once because it came with a tablet, but I never used it again. It would get focus for about 1/10th of a second before switching back to the previous application.

## `focuscheck.py`

There is also a similar Python program, `focuscheck.py`, which works by polling every 0.1 seconds, instead of listening to application change events.

The code is from [this answer](https://apple.stackexchange.com/a/285090) on Stack Overflow.
