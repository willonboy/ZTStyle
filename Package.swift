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
         .package(url: "https://github.com/willonboy/ZTChain", .upToNextMinor(from: "2.0.0")),
    ],
    targets: [
        .target(
            name: "ZTStyle",
            dependencies: ["ZTChain"]),
    ],
    swiftLanguageVersions: [.v5]
)
