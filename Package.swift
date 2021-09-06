// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBsBoT",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CBsBoT",
            targets: ["CBsBoT"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CBsBoT",
            dependencies: [],
            resources: [.process("Resources")]),
        .testTarget(
            name: "cbsbotTests",
            dependencies: ["CBsBoT"]),
    ]
)
