# book_template
book template

Perfect! Here's a **step-by-step practical guide** to help you get started with **Markdown + Pandoc** for writing and generating your **EPUB** (and Kindle) books\u2014with syntax-highlighted code\u2014**from scratch**.

---

# **Your Complete Guide: Markdown + Pandoc for Technical eBooks**

---

## 1. Install the Necessary Tools

### On Ubuntu/Linux:

```bash
sudo apt update
sudo apt install pandoc
sudo apt install texlive  # Optional, only needed for PDF generation
```

For **syntax highlighting** (recommended):

```bash
sudo apt install python3-pygments
```

Alternatively, you can use **Pandoc's built-in highlighting**, which usually works fine without Pygments.

---

## 2. Create Your Project Structure

```
my-ebook/
  00-metadata.yaml
  01-introduction.md
  02-getting-started.md
  03-advanced-topics.md
  cover.png    # Optional (for EPUB/Kindle)
```

---

## 3. Write Your Markdown Files

### Example: `01-introduction.md`

````markdown
# Introduction

Welcome to **My Programming Book**.

In this book, you'll learn how to write code like a pro.

## Example Code

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
````

Use standard Markdown:
- `#` for chapters
- `##` for sections
- Triple backticks + language name for syntax-highlighted code.

---

## 4. Create Metadata File (`00-metadata.yaml`)

```yaml
title: "My Programming Book"
author: "Nacho"
language: "en"
cover-image: cover.png    # Optional: provide a 1600x2560 cover if you want
rights: "© 2025 Nacho"
````

---

## 5. Build the EPUB

In the terminal (inside `my-ebook` folder):

```bash
pandoc 00-metadata.yaml 01-introduction.md 02-getting-started.md 03-advanced-topics.md \
-o my-programming-book.epub \
--toc \
--highlight-style tango
```
Where:
- `--toc`: generates Table of Contents
- `--highlight-style`: picks code color scheme (try: `tango`, `pygments`, `kate`, etc.)
---

## 6. Convert EPUB to Kindle

To reach Kindle readers:

1. Install **Kindle Previewer** (free, Windows/Mac).
2. Open your `.epub` in Kindle Previewer \u2192 it will auto-convert to **KPF** (Kindle Publishing Format).

Or use **Calibre** to convert to **MOBI/AZW3**.

---

## 7. Optional: Automate with Makefile

Example `Makefile`:

```makefile
BOOK=MyProgrammingBook
CHAPTERS=00-metadata.yaml 01-introduction.md 02-getting-started.md 03-advanced-topics.md

all:
	pandoc $(CHAPTERS) -o $(BOOK).epub --toc --highlight-style tango
```

Run:

```bash
make
```

---

## 8. Additional Tips

| Task                     | How To                                                        |
| ------------------------ | ------------------------------------------------------------- |
| Change code color scheme | `--highlight-style` + theme name (`pygments`, `tango`, etc.)  |
| Add images               | `![Alt text](images/example.png)`                             |
| Create cross-references  | `[See Chapter 2](#getting-started)` (use headings as anchors) |
| Customize EPUB CSS       | Use `--css my-style.css` (for advanced styling)               |
| Generate PDF             | Add `-o mybook.pdf` (requires LaTeX installed)                |

---

## 9. Kindle-Specific Advice

* Kindle devices don't always respect full EPUB styling. Test with **Kindle Previewer**.
* For Amazon KDP, they prefer **KPF** (Kindle Create) or **EPUB** uploads.

---

## 10. Summary: Your Minimal Workflow

```bash
pandoc 00-metadata.yaml *.md -o my-book.epub --toc --highlight-style tango
```

Result: Clean, colored, lightweight **EPUB** ready for e-readers.

Convert to **Kindle**: Kindle Previewer \u2192 KPF.

---

If you want, I can also generate a **ready-to-use folder template** (with example files and Makefile) that you can just clone or download. Do you want that too?

## Generate with Docker

To generate the book using Docker, run the following command:

`docker compose run book-builder`

