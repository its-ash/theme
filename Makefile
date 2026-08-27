DEVICE := iPhone 17

run:
	xcrun simctl boot "$(DEVICE)" 2>/dev/null || true
	open -a Simulator
	until xcrun simctl list devices booted | grep -q "$(DEVICE)"; do sleep 1; done
	cd example && flutter pub get && flutter run -d "$(DEVICE)"

deploy: docs

docs:
	cd example && flutter pub get && flutter build web --base-href /theme/ --release
	rm -rf docs
	mkdir docs
	cp -R example/build/web/. docs/
	touch docs/.nojekyll

commit:
	git add -A
	git commit -m "$$(gh copilot suggest -t commit)"
