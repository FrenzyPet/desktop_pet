// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DesktopPet",
    platforms: [.macOS(.v15)],
    targets: [
        // Чистая логика питомца: без AppKit/SpriteKit, полностью тестируемая.
        .target(name: "PetCore"),
        // Оболочка macOS: окна, рендер, ввод, меню-бар.
        .executableTarget(
            name: "DesktopPet",
            dependencies: ["PetCore"]
        ),
        .testTarget(name: "PetCoreTests", dependencies: ["PetCore"]),
    ]
)
