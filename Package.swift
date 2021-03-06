// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HJChartView",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "HJChartView",
            targets: ["HJChartView"]),
        .library(
            name: "HJGaugeView",
            targets: ["HJGaugeView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HJChartView",
            dependencies: []),
        .target(
            name: "HJGaugeView",
            dependencies: []),
    ]
)
