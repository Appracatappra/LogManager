//
//  File.swift
//  
//
//  Created by Kevin Mullins on 10/19/23.
//
import Foundation
import OSLog
 
/// A helper class to incorporate logging that will be deactivated when the app is built for release.
open class Debug {
    // MARK: - Static Properties
    /// Holds any logs that are built when they are first called.
    private nonisolated(unsafe) static var logs:[String:Logger] = [:]
    
    /// Holds the last message that was saved when the `log` function is called. This is used to suppress duplicates.
    private nonisolated(unsafe) static var lastMessage:String = ""
    
    // MARK: Static Functions
    /// Finds the given log by `subsystem` and `category`. If an existing log does not exist, a new one is created and saved to the collection.
    /// - Parameters:
    ///   - subsystem: The subsystem for the log. This is typically the app's signature in the form `com.company.appname`.
    ///   - category: The category of the log. This is typically the class or struct that the log is being created for.
    /// - Returns: Either an existing log for the matching criteria or a new log if one did not already exist.
    private static func logFor(subsystem:String, category:String) -> Logger {
        let key = subsystem + category
        
        if let log = logs[key] {
            return log
        } else {
            let log = Logger(subsystem: subsystem, category: category)
            logs[key] = log
            return log
        }
    }
    
    /// Creates a log entry using the `print` statement for speed. Logging will be supressed in release builds.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - suppressDuplicates: If `true` duplicate entries will be suppressed.
    public static func log(_ message:String, suppressDuplicates:Bool = true) {
        #if DEBUG
        if suppressDuplicates {
            if message != lastMessage {
                print(message)
                lastMessage = message
            }
        } else {
            print(message)
        }
        #endif
    }
    
    /// Creates an `info` entry in the given log. Logging will be supressed in release builds.
    /// - Parameters:
    ///   - subsystem: The subsystem for the log.
    ///   - category: The category for the log.
    ///   - message: The message to log.
    public static func info(subsystem:String, category:String, _ message:String) {
        #if DEBUG
        let log = logFor(subsystem: subsystem, category: category)
        log.info("\(message)")
        #endif
    }
    
    /// Creates an `error` entry in the given log. Logging will be supressed in release builds.
    /// - Parameters:
    ///   - subsystem: The subsystem for the log.
    ///   - category: The category for the log.
    ///   - message: The message to log.
    public static func error(subsystem:String, category:String, _ message:String) {
        #if DEBUG
        let log = logFor(subsystem: subsystem, category: category)
        log.error("\(message)")
        #endif
    }
    
    /// Creates a `notice` entry in the log. Logging will be supressed in release builds.
    /// - Parameters:
    ///   - subsystem: The subsystem for the log.
    ///   - category: The category for the log.
    ///   - message: The message to log.
    public static func notice(subsystem:String, category:String, _ message:String) {
        #if DEBUG
        let log = logFor(subsystem: subsystem, category: category)
        log.notice("\(message)")
        #endif
    }
}

