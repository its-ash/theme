DEVICE := iPhone 17

run:
	xcrun simctl boot "$(DEVICE)" 2>/dev/null || true
	open -a Simulator
	until xcrun simctl list devices booted | grep -q "$(DEVICE)"; do sleep 1; done
	cd example && flutter pub get && flutter run -d "$(DEVICE)"
