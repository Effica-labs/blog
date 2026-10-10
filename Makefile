MESSAGE ?= updates to blog

blog:
	@read -p "Post name: " name; \
	slug=$$(echo "$$name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-'); \
	if [ -z "$$slug" ]; then echo "Please provide a valid name."; exit 1; fi; \
	file="src/content/writings/$$slug.mdx"; \
	date=$$(date +%Y-%m-%d); \
	{ \
		echo '---'; \
		echo "title: \"$$name\""; \
		echo 'description: ""'; \
		echo "date: $$date"; \
		echo 'draft: false'; \
		echo 'author: Daniel Bergmann'; \
		echo '---'; \
		echo ''; \
	} > "$$file"; \
	echo "Created $$file"

git:
	@echo "Staging all changes..."
	git add .
	@echo "Committing changes with message: $(MESSAGE)"
	git commit -m "$(MESSAGE)"
	@echo "Pushing to origin..."
	git push

.PHONY: push blog
