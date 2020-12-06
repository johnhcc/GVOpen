# ![Icon](https://images2.imgbox.com/78/8b/v4hxbHk4_o.png) GVOpen
### Version 2.2 (Released 2020/11/29)

https://github.com/johnhcc

___

### Quick Installation:

- Grab the DMG file at
[this link](https://drive.google.com/file/d/1trgnp5eB95mZn5uK39_zBBbFiGzeOFs4)

- Proceed to Section 2 of this document!

___

### 1. About

GVOpen is a small macOS application that opens GV (a derivative of Ghostview) directly from macOS. This allows postscript (ps) and encapsulated postscript (eps) files to be opened in GV when their icon is double-clicked or dropped onto the application.

The reason I wrote this simple utility is that I found myself frustrated by the way that macOS handles the display of .ps and .eps files. By default, when you double-click on such a file, it is first converted to PDF and then displayed in Preview.

The problem here is twofold: (1) The conversion to PDF is time-consuming, and (2) the resulting image can be of lower quality than the original.

This utility solves these problems by opening these files directly in GV, an open source postscript viewer that is widely used in the science and technical communities. GVOpen uses Perl and the script wrapper Platypus (Sveinbjorn Thordarson, https://sveinbjorn.org/platypus) to provide an interface between macOS and GV, a necessary complication since GV is an X11 application and not native to macOS.

___

### 2. Installation

NOTE: YOU MUST ALREADY HAVE GV (`gv`), AND AN X11-ENABLED VERSION OF GHOSTSCRIPT INSTALLED BEFORE THIS UTILITY WILL BE USEFUL.

If you don't already have these, you can easily install them with Homebrew, which can itself be installed by following instructions at https://brew.sh. With Homebrew installed, you can (if you need to) install both GV and an X11-enabled version of Ghostscript with the following command:

`brew install johnhcc/gs-x11/gv`

Make sure that the Ghostscript is X11-enabled! The above command will do this automatically, but note that the default Ghostscript installed by Homebrew does not.

Once `gv` is your path:

1. Open the DMG and drag the GVOpen folder that is inside into your Applications folder. Starting the GVOpen application icon should now open GV.

   (If you get a warning about opening an application from an unidentified developer, then run the application the first time by control-clicking (or right-clicking) and choosing 'Open'.)

2. Try double-clicking a .ps file somewhere on your system. If the file doesn't open with GVOpen (meaning it doesn't show up in a new GV window, but is instead opened in Preview or some other application), you will need to tell macOS that it should use GVOpen to open this type of file.

   One easy way to do this is to find a .ps file on your system with Finder. Highlight the file and press Command-i to show the Info  dialog. Near the bottom you will see "Open with:". Click the triangle next to it to expand this section if necessary. Select GVOpen from the drop-down list. If it is not in the drop-down list, choose "Other..." and then navigate to GVOpen in your Applications folder.

   Once you've selected GVOpen, click the Always Open With box and then Add. Now you need to apply this change to all your .ps files, so click the Change All button.

3. Repeat step 3 for .eps files.

You should now be able to double-click any .ps or .eps file (or drop the file onto the GVOpen application) and have the image open in a new gv window. That's it!

___

### 3. Providing optional arguments when starting gv

If you wish to provide optional arguments to GV every time is starts through GVOpen, create a text file in your home directory named:
.gvopen

This file should contain a single line with one or more optional arguments separated by spaces. You can type `gv --help` on the command line to see the options available.

For example, to instruct GVOpen to start GV and display all files in grayscale, updating the display if the file changes on disk, use:

`--grayscale --watch`

___

### 4. Uninstall

1. Delete the GVOpen folder from Applications or wherever you put it.

2. Delete the .gvopen file in your home directory, if it exists.

3. Delete the org.haynes.GVOpen folder in the Library/Caches folder under your home directory.

___

### 5. Troubleshooting

If GV opens when you use GVOpen, but the requested files are not displayed, a likely explanation is that your version of Ghostcript is not X11-enabled. See the instructions in section 2 of this document, "Installation".

___

### 6. License, acknowledgements, and contact information

The license for this software is provided in the [LICENSE.txt](LICENSE.txt) file that is included with this distribution.

The icon was derived from the public domain Tango icon theme.

Contact information:<br/>
John M. Haynes<br/>
Email: johnhcc.code@gmail.com
