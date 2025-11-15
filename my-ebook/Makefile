BOOK=cpp_low_latency
CHAPTERS=01-introduction.md \
	 02-getting-started.md \
	 03-advanced-topics.md

METADATA_FILE=00-metadata.yaml

all: $(BOOK).epub

$(BOOK).epub: $(METADATA_FILE) $(CHAPTERS)
	pandoc --metadata-file=$(METADATA_FILE) $(CHAPTERS) \
	       -o $@ \
	       --to=epub2 \
	       --toc \
	       --highlight-style kate \
	       --css=epub-fix.css \
	       --verbose \
	       --log generate_pandoc.log \
				 --metadata="identifier:urn:uuid:$(shell uuidgen)

clean:
	rm -f $(BOOK).epub

pretty:
	find . -name '*.md' -exec python format_md_codeblocks.py {} \; \
	&& prettier --embedded-language-formatting off --write *.md \
	&& sed -i '/<!-- prettier-ignore -->/d' *.md

view:
	ebook-viewer ./$(BOOK).epub &


