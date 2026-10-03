MESSAGE ?= Automated push from Makefile

git:
	@echo "Staging all changes..."
	git add .
	@echo "Committing changes with message: $(MESSAGE)"
	git commit -m "$(MESSAGE)"
	@echo "Pushing to origin..."
	git push

.PHONY: push
