// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cbsbot",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "cbsbot",
            targets: ["cbsbot"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "cbsbot",
            dependencies: [],
            resources: [.process("Resources")]),
        .testTarget(
            name: "cbsbotTests",
            dependencies: ["cbsbot"]),
    ]
)
