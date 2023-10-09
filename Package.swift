// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JCDDecoder",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "JCDDecoder",
            targets: ["JCDDecoder"]),
    ],
    targets: [
        .target(
            name: "JCDDecoder"),
        .testTarget(
            name: "JCDDecoderTests",
            dependencies: ["JCDDecoder"]),
    ]
)
