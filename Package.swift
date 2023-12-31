// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FIRDatabaseWrapper",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FIRDatabaseWrapper",
            targets: ["FIRDatabaseWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git",
                 .upToNextMajor(from: "10.19.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FIRDatabaseWrapper",
            dependencies: [
              .product(name: "FirebaseDatabase", package: "firebase-ios-sdk"),
              ]),
        .testTarget(
            name: "FIRDatabaseWrapperTests",
            dependencies: ["FIRDatabaseWrapper"]),
    ],
    swiftLanguageVersions: [.v5]
)
