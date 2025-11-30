BOOK=science_of_supplements
CHAPTERS=001-preface.md \
		Introduction.md \
		chapter_01.md \
		chapter_02.md \
		chapter_03.md \
		chapter_04.md \
		chapter_05.md \
		chapter_06.md \
		chapter_07.md \
		chapter_08.md \
		chapter_09.md \
		chapter_10.md \
		Conclusion.md


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


