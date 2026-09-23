# =====================================================================
#  R/_freeze.R  -  helper to freeze R console output and figures
#
#  freeze(name, seed, fig, fig.w, fig.h)
#    - sources R/snippets/<name>.R with a fixed seed
#    - captures VISIBLE console results (not echoed code) to output/<name>.txt
#      (the code itself is shown in the book straight from the snippet file,
#       so code and output can never drift apart)
#    - if fig=TRUE, the snippet's plot is written to figures/<name>.pdf
#
#  Keeps the book build pure-LaTeX while R sources stay the single source
#  of truth, regenerable on demand:  Rscript R/build.R  (run from repo root)
# =====================================================================

# ggplot/patchwork (ggsurvfit + add_risktable, for one) can leave a blank first
# page on the pdf device.  Of a multi-page figure only the last page is kept
# (that is the page with the drawing).  Uses poppler's pdfinfo/pdftocairo,
# which MiKTeX includes.
.trim_fig <- function(figfile) {
  pinfo <- Sys.which("pdfinfo"); pcairo <- Sys.which("pdftocairo")
  if (pinfo == "" || pcairo == "") return(invisible())
  out <- tryCatch(system2(pinfo, shQuote(figfile), stdout = TRUE),
                  error = function(e) character())
  m <- grep("^Pages:", out, value = TRUE)
  npg <- if (length(m)) suppressWarnings(as.integer(sub("^Pages:\\s*", "", m[1]))) else NA
  if (!is.na(npg) && npg > 1) {
    tmp <- paste0(figfile, ".tmp")
    system2(pcairo, c("-pdf", "-f", npg, "-l", npg, shQuote(figfile), shQuote(tmp)))
    if (file.exists(tmp)) {
      file.remove(figfile); file.rename(tmp, figfile)
      message(sprintf("  trimmed blank page(s): %s (kept last of %d)", figfile, npg))
    }
  }
  .crop_fig(figfile)
  invisible()
}

#  Crop the white border (2026-09-20).
#  An R graphics device makes a fig.w x fig.h canvas and draws inside it, so
#  whatever the drawing does not fill stays as white border.  The \rfigure
#  widths of the book are set to the cropped size (the printed drawing keeps its
#  size), so without cropping here every figure would print smaller.  2bp is the
#  least margin that keeps the ink off the text.
.crop_fig <- function(figfile) {
  pcrop <- Sys.which("pdfcrop")
  if (pcrop == "") return(invisible())
  tmp <- paste0(figfile, ".crop")
  ok <- tryCatch(system2(pcrop, c("--margins", "2", shQuote(figfile), shQuote(tmp)),
                         stdout = FALSE, stderr = FALSE),
                 error = function(e) 1L)
  if (identical(as.integer(ok), 0L) && file.exists(tmp)) {
    file.remove(figfile); file.rename(tmp, figfile)
  } else if (file.exists(tmp)) {
    file.remove(tmp)
  }
  invisible()
}

# ---------------------------------------------------------------------
#  Truncating a long component of the output (trim=)
#
#  A fitting function such as wnl::nlr puts $Prediction and $Residual vectors,
#  one element per observation, into its result list.  Printed as they are, one
#  output runs past 130 lines and fills most of a page with the same numbers
#  over and over (SAS textbooks print only the essential output too).  Declaring
#  freeze(..., trim = c("Prediction", "Residual")) keeps the header of that
#  component and its first trim.keep lines, cuts the rest, and marks the cut.
#  The component is not removed altogether, so the reader still sees what it is
#  and what its values look like, and the cut is visible on the page.
.trim_blocks <- function(txt, trim, trim.keep = 2L) {
  if (!length(trim)) return(txt)
  hdr <- grepl("^\\$", txt)                       # header line of a list component
  keep <- rep(TRUE, length(txt))
  marks <- character(length(txt))
  for (nm in trim) {
    pat   <- paste0("^\\$`?", nm, "`?$")          # e.g. $Prediction
    child <- paste0("^\\$`?", nm, "`?\\$")        # e.g. $Prediction$x (a sub-component)
    for (s in which(grepl(pat, txt))) {
      nxt <- which(hdr & seq_along(txt) > s & !grepl(child, txt))
      e <- if (length(nxt)) min(nxt) - 1L else length(txt)
      # Keep the header (s) and the first trim.keep lines that carry values, then
      # cut everything down to e (including the blank lines a sub-component leaves
      # behind, so that blanks do not pile up).
      body <- (s + 1L):e
      body <- body[nzchar(trimws(txt[body]))]     # count only the lines carrying values
      if (length(body) > trim.keep) {
        keep[body[trim.keep + 1L]:e] <- FALSE
        marks[body[trim.keep]] <- getOption("ctda.trimmark", "  ... (output truncated)")
      }
    }
  }
  out <- character(0)
  for (i in seq_along(txt)) {
    if (keep[i]) out <- c(out, txt[i])
    if (nzchar(marks[i])) out <- c(out, marks[i], "")   # one blank line before the next component
  }
  # Cutting can leave consecutive blank lines; squeeze them into one.
  blank <- !nzchar(trimws(out))
  out[!(blank & c(FALSE, head(blank, -1)))]
}

# ---------------------------------------------------------------------
#  Removing a component altogether (drop=)
#
#  Unlike trim=, this deletes the component.  It is for a component of a single
#  line, where truncating means nothing and the value is not worth the page.
#  Used now for $`Elapsed Time` of nlr(): it changed at every run and was the one
#  thing that broke the reproducibility of the frozen output (the same reason the
#  Sys.time() output of ch14 was removed).
.drop_blocks <- function(txt, drop) {
  if (!length(drop)) return(txt)
  hdr <- grepl("^\\$", txt)
  keep <- rep(TRUE, length(txt))
  for (nm in drop) {
    pat   <- paste0("^\\$`?", nm, "`?$")
    child <- paste0("^\\$`?", nm, "`?\\$")
    for (s in which(grepl(pat, txt))) {
      nxt <- which(hdr & seq_along(txt) > s & !grepl(child, txt))
      e <- if (length(nxt)) min(nxt) - 1L else length(txt)
      keep[s:e] <- FALSE
    }
  }
  txt[keep]
}

# ---------------------------------------------------------------------
#  Removing blank lines (squeeze=)
#
#  R puts a blank line after every component when it prints a list.  In an nlr()
#  result with nearly 20 components those blanks alone come to nearly 20 lines,
#  which the page is better without.  Every component starts with a '$name'
#  header, so the boundaries stay clear without them.
.squeeze_blanks <- function(txt) txt[nzchar(trimws(txt))]

# Shared session environment: snippets run in order (like a real R session)
# so later snippets can use variables/objects defined by earlier ones within
# the same chapter (e.g. lh2, Lik, t1).  Reset between chapters with new_session().
.session <- new.env(parent = globalenv())
new_session <- function() .session <<- new.env(parent = globalenv())

freeze <- function(name, seed = 1L, fig = FALSE, fig.w = 5, fig.h = 3.2,
                   width = 76, digits = 7, env = .session,
                   trim = NULL, trim.keep = 2L, drop = NULL, squeeze = FALSE) {
  # Running a subset (2026-09-22): a regular expression in ctda.only freezes only
  # the names it matches, one in ctda.skip skips them.  It is how the "a separate
  # Rscript process per group" that the chapter 17 comment asks for is done while
  # still using this one build.R.  With the default (NULL) everything is frozen.
  only <- getOption("ctda.only", NULL);  skip <- getOption("ctda.skip", NULL)
  if ((!is.null(only) && !grepl(only, name)) || (!is.null(skip) && grepl(skip, name)))
    return(invisible(NULL))

  # The paths, the figure face and the truncation mark are options (2026-09-22),
  # so that another edition can redirect them and source this file unchanged.
  # The defaults below are the ones this repository is frozen with.
  snippet <- file.path(getOption("ctda.snipdir", "R/snippets"), paste0(name, ".R"))
  outfile <- file.path(getOption("ctda.outdir",  "output"),     paste0(name, ".txt"))
  figfile <- file.path(getOption("ctda.figdir",  "figures"),    paste0(name, ".pdf"))
  stopifnot(file.exists(snippet))

  old <- options(width = width, digits = digits)
  on.exit(options(old), add = TRUE)
  set.seed(seed)

  # The face of the figures.  The 22 matplotlib figures of pyfig/ are set in the
  # same one, so every figure of the book matches.  Without cairo this falls back
  # to pdf(), whose font handling is cruder.
  if (fig) {
    if (capabilities("cairo")) grDevices::cairo_pdf(figfile, width = fig.w, height = fig.h,
                                                    family = getOption("ctda.figfont", "Arial"))
    else grDevices::pdf(figfile, width = fig.w, height = fig.h)
    on.exit({ if (length(grDevices::dev.list())) grDevices::dev.off() }, add = TRUE)
  }

  # ctda.continue = TRUE (En/build.R, 2026-09-22): a snippet that errors is logged to
  # ctda.faillog and skipped instead of halting the whole run; its output file is left
  # as it was and a half-written figure is replaced by the Korean edition's copy.
  # Default FALSE keeps the Korean build's behavior (stop on the first error).
  if (isTRUE(getOption("ctda.continue", FALSE))) {
    txt <- tryCatch(utils::capture.output(
      source(snippet, echo = FALSE, print.eval = TRUE, keep.source = FALSE,
             local = env)), error = function(e) e)
    if (inherits(txt, "error")) {
      msg <- sprintf("FAILED: %s: %s", name, conditionMessage(txt))
      message("  ", msg)
      cat(msg, file = getOption("ctda.faillog", "freeze-failures.txt"),
          sep = "\n", append = TRUE)
      if (fig) {
        if (length(grDevices::dev.list())) grDevices::dev.off()
        ko <- file.path("figures", basename(figfile))
        if (file.exists(ko) && !identical(normalizePath(ko), normalizePath(figfile, mustWork = FALSE)))
          file.copy(ko, figfile, overwrite = TRUE)
      }
      return(invisible(NULL))
    }
  } else {
    txt <- utils::capture.output(
      source(snippet, echo = FALSE, print.eval = TRUE, keep.source = FALSE,
             local = env)
    )
  }
  txt <- .drop_blocks(txt, drop)
  txt <- .trim_blocks(txt, trim, trim.keep)
  if (squeeze) txt <- .squeeze_blanks(txt)
  writeLines(txt, outfile)
  if (fig) { if (length(grDevices::dev.list())) grDevices::dev.off()
             .trim_fig(figfile) }
  message(sprintf("  frozen: %-26s -> %s%s", snippet, outfile,
                  if (fig) paste0(" + ", figfile) else ""))
  invisible(txt)
}
