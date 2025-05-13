// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Privacy Manifest Info: https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/adding_a_privacy_manifest_to_your_app_or_third-party_sdk
// Privacy Manifest Example: https://apnspush.com/add-privacy-manifest-sdk

import PackageDescription

let package = Package(
    name: "LogManager",
    platforms: [.iOS(.v18), .macOS(.v15), .tvOS(.v18), .watchOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LogManager",
            targets: ["LogManager"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LogManager",
            resources: [.process("Resources")],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "LogManagerTests",
            dependencies: ["LogManager"]),
    ]
)
