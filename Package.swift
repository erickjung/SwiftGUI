// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGUI",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "SwiftGUI",
            targets: ["SwiftGUI"]),
    ],
    targets: [
        // C++/ObjC ImGui bridge
        .target(
            name: "ImGuiBridge",
            path: "Source/Core",
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("imgui"),
                .headerSearchPath("imgui/render"),
                .headerSearchPath("thirdparty/ImGuiColorTextEdit"),
            ]
        ),
        // Swift GUI layer
        .target(
            name: "SwiftGUI",
            dependencies: ["ImGuiBridge"],
            path: "Source",
            exclude: ["Core"],
            resources: [
                .copy("Resources/Fonts/FiraCodeRegular.ttf")
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]
        ),
        .testTarget(
            name: "SwiftGUITests",
            dependencies: ["SwiftGUI"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]),
    ],
    cxxLanguageStandard: .cxx17
)
