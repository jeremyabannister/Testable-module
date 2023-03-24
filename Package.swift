// swift-tools-version: 5.7

///
import PackageDescription

///
let package = Package(
    name: "Testable-module",
    products: [
        .library(
            name: "Testable-module",
            targets: ["Testable-module"]
        ),
        .library(
            name: "TestableTestToolkit",
            targets: ["TestableTestToolkit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage-module",
            from: "0.1.0"
        ),
        .package(
            url: "https://github.com/jeremyabannister/XCTestToolkit",
            from: "0.1.5"
        ),
    ],
    targets: [
        .target(
            name: "Testable-module",
            dependencies: [
                "ErrorMessage-module",
            ]
        ),
        .target(
            name: "TestableTestToolkit",
            dependencies: [
                "Testable-module",
                "XCTestToolkit",
            ]
        ),
        .testTarget(
            name: "Testable-tests",
            dependencies: [
                "TestableTestToolkit",
            ]
        ),
        .testTarget(
            name: "TestableTestToolkit-tests",
            dependencies: [
                "TestableTestToolkit",
            ]
        ),
    ]
)
