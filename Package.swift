// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "Frisson",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Frisson",
            targets: ["Frisson"]
        )
    ],
    targets: [
        .target(
            name: "Frisson"
        ),
        .testTarget(
            name: "FrissonTests",
            dependencies: ["Frisson"]
        )
    ]
)
