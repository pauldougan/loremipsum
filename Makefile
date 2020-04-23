.DEFAULT_GOAL := help

ifdef VERBOSE
VERBOSE_FLAG:=--verbose
endif

LINKCHECKER := linkchecker --ignore-url=^mailto: -f ./.linkchecker.rc $(VERBOSE_FLAG)
SERVER_PORT?=4567

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: dependencies
dependencies: ## Install dependencies
	brew cask install drawio
	brew install csvkit
	brew install ffmpeg
	brew install figlet
	brew install graphviz
	brew install pandoc
	python3 -m venv venv
	pip3 install -r requirements.txt

all: ## Builds the project
	@echo "Generate files..."
	@mkdir -p build
	pandoc source/index.md > build/index.html
	faker paragraph -r 3 -s '' | gsed 's/\.//g' > build/loremipsum.txt
	figlet 'lorem ipsum' > build/loremipsum.figlet.txt
	scripts/loremipsum.md.py > build/loremipsum.md
	scripts/loremipsum.csv.py > build/loremipsum.csv
	pandoc -f markdown build/loremipsum.md -t html5 -o build/loremipsum.html
	pandoc -f markdown build/loremipsum.md -t docx -o build/loremipsum.docx
	pandoc -f markdown build/loremipsum.md -t odt -o build/loremipsum.odt
	
.PHONY: clean
clean: ## Clean out the filesystem
	@echo "Clean up"
	rm -rvf build

.PHONY: test
test: test-filesystem test-local-http ## Runs the tests

.PHONY: test-filesystem
test-filesystem: build ## checks links against the build dir directly
	$(LINKCHECKER) index.html

.PHONY: test-local-http
test-local-http: build ## checks links against the build dir over HTTP
	ruby \
	  -run \
	  -ehttpd \
	  ./build/ \
	  -p$(SERVER_PORT) \
	>/dev/null 2>&1 & SERVER_PID=$$! ; \
	$(LINKCHECKER) http://localhost:$(SERVER_PORT) ; \
	LINKCHECKER_STATUS=$$? ; \
	kill $${SERVER_PID} ; \
	exit $${LINKCHECKER_STATUS}
