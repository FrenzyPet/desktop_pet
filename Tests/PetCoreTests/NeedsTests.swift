import Testing
@testable import PetCore

@Test func needsDecayOverTime() {
    var needs = Needs()
    needs.advance(by: 3600)
    #expect(needs.satiety < 1)
    #expect(needs.energy < 1)
    #expect(needs.mood < 1)
}

@Test func needsNeverGoBelowZero() {
    var needs = Needs()
    needs.advance(by: 3600 * 24 * 365)
    #expect(needs == Needs(satiety: 0, energy: 0, mood: 0))
}
