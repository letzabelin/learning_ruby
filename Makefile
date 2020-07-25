test:
	bundle exec rspec

start:
	rails s

lint:
	bundle exec rubocop

linter-fix-all:
	bundle exec rubocop --auto-correct-all

.PHONY: test
