
test_that("fix_items_in_file()", {
    indir <- system.file(package="fixRdItems", "extdata")
    rdfiles <- dir(indir, pattern="\\.Rd$")
    outfile <- tempfile()
    for (i in seq_along(rdfiles)) {
        rdfile <- rdfiles[[i]]
        infile <- file.path(indir, rdfile)
        fix_items_in_file(infile, outfile)
        expected_file <- file.path(indir, "fixed", rdfile)
        expect_identical(readLines(outfile), readLines(expected_file))
    }
})

