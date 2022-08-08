#!/usr/bin/env Rscript
library("optparse")

#how to use this:
#./buildR            :: builds the course
#./buildR --quiet    :: builds the course quietly (less verbose)
#./buildR --bibtex   :: builds the course and updates references

option_list = list(
  make_option(c("-q","--quiet"), type="logical", action="store_true",
              help="Render books quitely-ish [default= %default]"),
  make_option(c("-b","--bibtex"), type="boolean", action="store_true",
              help="Update and format BibTeX resources [default= %default]")
);
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

# Update references
if(!is.null(opt$bibtex)){
  message("[*] Update BibTeX info from online resources")
  system("betterbib update --quiet --in-place book.bib")
  system("betterbib format --in-place book.bib")
}

# render books
book_formats = c('bookdown::gitbook', 'bookdown::pdf_book')
message("[*] Rendering books")
for (fmt in book_formats) {
  message(sprintf("   -- Building format: %s", fmt))
  # change FALSE => TRUE if you want it less verbose
  cmd = sprintf("bookdown::render_book('index.Rmd', '%s', quiet = %s)", fmt, is.null(opt$quiet))
  res = xfun::Rscript(c('-e', shQuote(cmd)))
  if (res != 0) stop('Failed to compile the book to ', fmt)
}

# ...or run from bash individually:
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
#
