import AppKit

// Ходячий скелет: прозрачное окно поверх всех приложений с квадратом-заглушкой
// и пункт в меню-баре. Проверяет, что стек собирается и запускается.
// Настоящий оверлей и SpriteKit-сцена — M1 (см. docs/ROADMAP.md).

let app = NSApplication.shared
app.setActivationPolicy(.accessory)  // без иконки в Dock

let size = NSSize(width: 64, height: 64)
let visible = NSScreen.main?.visibleFrame ?? .zero
let window = NSWindow(
    contentRect: NSRect(origin: NSPoint(x: visible.midX - size.width / 2, y: visible.minY), size: size),
    styleMask: .borderless,
    backing: .buffered,
    defer: false
)
window.isOpaque = false
window.backgroundColor = .clear
window.hasShadow = false
window.level = .floating
window.collectionBehavior = [.canJoinAllSpaces, .stationary]
window.isMovableByWindowBackground = true

let placeholder = NSView(frame: NSRect(origin: .zero, size: size))
placeholder.wantsLayer = true
placeholder.layer?.backgroundColor = NSColor.systemOrange.cgColor
placeholder.layer?.cornerRadius = 12
window.contentView = placeholder
window.orderFrontRegardless()

let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
statusItem.button?.title = "🐾"
let menu = NSMenu()
menu.addItem(NSMenuItem(title: "Выйти", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
statusItem.menu = menu

app.run()
