# iOS Apps

![ios-version](https://img.shields.io/badge/iOS-16-blue) ![xcode-version](https://img.shields.io/badge/XCode-14.3-red)

Simple to Medium-complexity iOS proof-of-concept apps.


# Running iOS Simulators on M1 / M2 Macbooks
You need to go to **Product > Destination > Destination Architecture** and
enable the **Show Both** option.

Then from the main XCode IDE Destination selection dropdown (top-center),
you must choose a "Rosetta" option.


# Viewing / Adding New Frameworks
Frameworks can be viewed by selecting the main application object in the workspace
**Project Navigator** viewer on the left, then clicking on the **Build Phases** 
tab, then expanding the **Link Binary With Libraries** expander, and then clicking 
the Plus (+) button in the bottom-left of the expander component.

**Frameworks** are similar to **Artifact Dependencies** declared in Gradle build 
files, for the Android ecosystem. These are like quick tools and plugins you can
import into your project, and are ready-to-use. Some example Frameworks that are 
built-in and preconfigured for the XCode ecosystem:
- AudioToolbox.framework
- AVKit.framework
- CarPlay.framework
- IdentityLookup.framework
- QuartzCore.framework
- SpriteKit.framework

The **Link Binary With Libraries** window also allows you to select 
`.tbd` **Libraries** such as:
- libswiftExtensionKit.tbd
- libswiftMetal.tbd
- libxml2.tbd
