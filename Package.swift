// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ZTStyle",
    platforms: [
        .iOS(.v13), .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ZTStyle",
            targets: ["ZTStyle"]),
    ],
    dependencies: [
         .package(url: "https://github.com/willonboy/ZTChain", branch: "main"),
    ],
    targets: [
        .target(
            name: "ZTStyle",
            dependencies: ["ZTChain"]),
    ],
    swiftLanguageVersions: [.v5]
)
