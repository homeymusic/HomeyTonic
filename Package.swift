// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tonic",
    platforms: [.iOS("16.0"), .macOS("10.15")],
    products: [.library(name: "Tonic", targets: ["Tonic"])],
    targets: [
        .target(name: "Tonic", resources: [.process("Tonic.docc")]),
        .testTarget(name: "TonicTests", dependencies: ["Tonic"]),
    ]
)
