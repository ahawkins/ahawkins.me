FLAGS:=$(subst .svg,.png,$(subst src/,dist/,$(wildcard src/flag/*.svg)))

dist/flag/%.png: src/flag/%.svg
	mkdir -p $(@D)
	convert -density 1200 -resize 4096@ $< $@

.PHONY: dist
dist: $(FLAGS)
	mkdir -p dist
	cp -rf src/* dist

.PHONY: deploy
deploy: dist
	aws --region eu-west-1 --profile ahawkins s3 sync dist/ s3://ahawkins.xyz

.PHONY: clean
clean:
	rm -rf dist
