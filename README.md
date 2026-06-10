# LogManager

![](https://img.shields.io/badge/license-MIT-green) ![](https://img.shields.io/badge/maintained%3F-Yes-green) ![](https://img.shields.io/badge/swift-6.0-green) ![](https://img.shields.io/badge/iOS-26.0-red) ![](https://img.shields.io/badge/macOS-26.0-red) ![](https://img.shields.io/badge/tvOS-26.0-red) ![](https://img.shields.io/badge/watchOS-26.0-red)


LogManager is a simple library to make it easier to add pretty debugging logging entries to an App project.

## Support

If you find `LogManager` useful and would like to help support its continued development and maintenance, please consider making a small donation, especially if you are using it in a commercial product:

<a href="https://www.buymeacoffee.com/KevinAtAppra" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

It's through the support of contributors like yourself, I can continue to build, release and maintain high-quality, well documented Swift Packages like `LogManager` for free.


## Installation

**Swift Package Manager** (Xcode 11 and above)

1. In Xcode, select the **File** > **Add Package Dependency…** menu item.
2. Paste `https://github.com/Appracatappra/LogManager.git` in the dialog box.
3. Follow the Xcode's instruction to complete the installation.

> Why not CocoaPods, or Carthage, or etc?

Supporting multiple dependency managers makes maintaining a library exponentially more complicated and time consuming.

Since, the **Swift Package Manager** is integrated with Xcode 11 (and greater), it's the easiest choice to support going further.

## Overview

The library is broken into two main parts: 

* `Debug` - Use the static **Debug** class when you only want the comments to be printed when the app is compiled for **Debug**.
* `Log` - Use the static **Log** class when you want the comments to be printed for both the **Debug** and **Release** versions of the app.

Both `Debug` and `Log` include the same set of functions: `log`, `info`, `error` and `notice`.
 
### Log
 
`static func log(_ message:String, suppressDuplicates:Bool = true)` 

Creates a simple log entry and optionally suppresses duplicate entries.

### Info
 
`static func info(subsystem:String, category:String, _ message:String)`

Writes an **Info** message to the log with an optional `subsystem` and `category` used to identify and group log entries.

### Error

`static func error(subsystem:String, category:String, _ message:String)`

Writes an **Error** message to the log with an optional `subsystem` and `category` used to identify and group log entries.

### Notice

`static func notice(subsystem:String, category:String, _ message:String)`

Writes an **Notice** message to the log with an optional `subsystem` and `category` used to identify and group log entries.

# Documentation

The **Package** includes full **DocC Documentation** for all features.
