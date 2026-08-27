DEVICE := iPhone 17

.PHONY: run deploy docs commit

run:
	xcrun simctl boot "$(DEVICE)" 2>/dev/null || true
	open -a Simulator
	until xcrun simctl list devices booted | grep -q "$(DEVICE)"; do sleep 1; done
	cd example && flutter pub get && flutter run -d "$(DEVICE)"

deploy: docs commit
	git push

docs:
	cd example && flutter pub get && flutter build web --base-href / --release
	find docs -mindepth 1 -not -name CNAME -delete
	cp -R example/build/web/. docs/
	touch docs/.nojekyll

commit:
	git add -A
	git diff --cached --quiet || git commit -m "$$(gh copilot -p 'Write a concise git commit message (subject line only, imperative mood, no quotes, under 72 chars) summarizing the currently staged git diff. Output only the commit message text, nothing else.' --allow-tool 'shell(git diff)' --allow-tool 'shell(git status)' --silent)"
