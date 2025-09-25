// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlyVerifyCSDK",
    platforms: [.iOS(.v10)], // 匹配OC Framework支持的最低版本
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FlyVerifyCSDK",
            targets: ["FlyVerifyCSDK"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "FlyVerifyCSDKSPM",
                      path: "Frameworks/FlyVerifyCSDK.xcframework"),
        .target(
            name: "FlyVerifyCSDK",
            dependencies: ["FlyVerifyCSDKSPM"],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
//                .unsafeFlags(["-ObjC"])
            ]),
        .testTarget(
            name: "FlyVerifyCSDKTests",
            dependencies: ["FlyVerifyCSDK"]
        ),
    ]
)
