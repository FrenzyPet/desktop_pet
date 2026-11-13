.PHONY: build run test format clean

build:
	swift build

run:
	swift run DesktopPet

# Без полного Xcode SwiftPM не находит макро-плагин Swift Testing сам — подсказываем путь.
TESTING_PLUGINS := $(shell xcode-select -p)/usr/lib/swift/host/plugins/testing

test:
	swift test -Xswiftc -plugin-path -Xswiftc $(TESTING_PLUGINS)

format:
	swift format --in-place --recursive Sources Tests Package.swift

clean:
	swift package clean
