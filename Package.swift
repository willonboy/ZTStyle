// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ZTStyle",
    platforms: [
        .iOS(.v11), .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ZTStyle",
            targets: ["ZTStyle"]),
    ],
    dependencies: [
         .package(url: "https://github.com/willonboy/ZTChain", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ZTStyle",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
