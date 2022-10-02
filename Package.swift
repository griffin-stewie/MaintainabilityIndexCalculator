// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaintainabilityIndexCalculator",
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax", branch: "0.50700.0"),
    ],
    targets: [
        .executableTarget(
            name: "MaintainabilityIndexCalculator",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxParser", package: "swift-syntax"),
                "lib_InternalSwiftSyntaxParser",
            ],
            linkerSettings: [
                .unsafeFlags(["-Xlinker", "-dead_strip_dylibs"])
            ]
        ),
        .testTarget(
            name: "MaintainabilityIndexCalculatorTests",
            dependencies: [
                "MaintainabilityIndexCalculator",
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxParser", package: "swift-syntax"),
                "lib_InternalSwiftSyntaxParser",
            ],
            linkerSettings: [
                .unsafeFlags(["-Xlinker", "-dead_strip_dylibs"])
            ]
        ),
        .binaryTarget(
            name: "lib_InternalSwiftSyntaxParser",
            url: "https://github.com/keith/StaticInternalSwiftSyntaxParser/releases/download/5.7/lib_InternalSwiftSyntaxParser.xcframework.zip",
            checksum: "99803975d10b2664fc37cc223a39b4e37fe3c79d3d6a2c44432007206d49db15"
        ),
    ]
)
