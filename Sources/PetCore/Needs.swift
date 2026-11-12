import Foundation

/// Потребности питомца. Каждое значение в диапазоне 0...1, где 1 — полностью удовлетворено.
/// Заготовка: реальные скорости и правила появятся в M2 (см. docs/ROADMAP.md).
public struct Needs: Equatable, Codable, Sendable {
    public var satiety: Double
    public var energy: Double
    public var mood: Double

    public init(satiety: Double = 1, energy: Double = 1, mood: Double = 1) {
        self.satiety = satiety
        self.energy = energy
        self.mood = mood
    }

    /// Продвигает симуляцию на `seconds`. Время всегда приходит снаружи —
    /// ядро не читает системные часы, поэтому тестируется детерминированно.
    public mutating func advance(by seconds: TimeInterval) {
        let hours = seconds / 3600
        satiety = Self.clamp(satiety - 0.10 * hours)
        energy = Self.clamp(energy - 0.06 * hours)
        mood = Self.clamp(mood - 0.08 * hours)
    }

    private static func clamp(_ value: Double) -> Double {
        min(1, max(0, value))
    }
}
