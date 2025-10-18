#!/usr/bin/make
SHELL= /bin/sh
TEX_FILENAME = resume-johnny-tran
PDFLATEX_ENV = SOURCE_DATE_EPOCH=$$(git log -1 --no-patch --format=%ct)

.PHONY: all brew clean clean-all docker docker-build docker-run lint

all: output/${TEX_FILENAME}.pdf

tex/glyphtounicode.tex:
	wget https://raw.githubusercontent.com/TeX-Live/texlive-source/svn70897/texk/lcdf-typetools/lcdf-typetools-src/glyphtounicode.tex \
		--directory-prefix=tex/

output/$(TEX_FILENAME).pdf: tex/glyphtounicode.tex
	${PDFLATEX_ENV} latexmk tex/$(TEX_FILENAME).tex

brew:
	brew install ghostscript imagemagick texlive

clean:
	latexmk -C tex/$(TEX_FILENAME).tex

clean-all: clean
	rm -rf .cache .texlive output

docker: docker-build docker-run

docker-build:
	docker build --tag=pandoc/pdflatex .

docker-run:
	docker run -i --rm \
		--network none \
		-u "$(shell id -u):$(shell id -g)" \
		-v ${PWD}:/data \
		-e HOME=/data \
		-e ${PDFLATEX_ENV} \
		pandoc/pdflatex tex/$(TEX_FILENAME).tex

# https://github.com/super-linter/super-linter/issues/5070#issuecomment-1885881566
# https://github.com/super-linter/super-linter/issues/5070#issuecomment-2058901647
lint:
	docker run \
		--platform linux/amd64 \
		-e DEFAULT_BRANCH=main \
		-e IGNORE_GITIGNORED_FILES=true \
		-e MARKDOWN_CONFIG_FILE=.markdownlint.json \
		-e NATURAL_LANGUAGE_CONFIG_FILE=.textlintrc.json \
		-e RUN_LOCAL=true \
		-e SHELL=/bin/bash \
		-e VALIDATE_ALL_CODEBASE=true \
		-e VALIDATE_BIOME_FORMAT=false \
		-e VALIDATE_BIOME_LINT=false \
		-e VALIDATE_GIT_COMMITLINT=false \
		-e VALIDATE_MARKDOWN_PRETTIER=false \
		-e VALIDATE_PYTHON_RUFF=false \
		-e YAML_CONFIG_FILE=.yamllint.yml \
		-v ${PWD}:/tmp/lint \
		ghcr.io/super-linter/super-linter:slim-v8.2.0

output:
	mkdir -p output

output/${TEX_FILENAME}.md: output tex/glyphtounicode.tex
	pandoc -s --to=plain --wrap=none tex/${TEX_FILENAME}.tex -o output/${TEX_FILENAME}.md

output/${TEX_FILENAME}.png: output output/${TEX_FILENAME}.pdf
	convert \
		-density 600 \
		-background white \
		-alpha background \
		-alpha off \
		-quality 100 \
		output/${TEX_FILENAME}.pdf output/${TEX_FILENAME}.png
