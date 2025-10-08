.create_empty_error_bars <- function() {
  structure(
    list(
      ref_lower = NULL,
      ref_upper = NULL
    ),
    class = "ms_error_bars"
  )
}

to_pml.ms_error_bars <- function(x, axis = c("x", "y")) {
  axis <- match.arg(axis)
  if (is.null(x$ref_lower) && is.null(x$ref_upper)) {
    return("")
  }

  paste0(
    "<c:errBars>",
    sprintf('<c:errDir val="%s"/>', axis),
    '<c:errBarType val="both"/>',
    '<c:errValType val="cust"/>',
    '<c:noEndCap val="0"/>',
    if (!is.null(x$ref_lower)) paste0("<c:minus>", to_pml(x$ref_lower), "</c:minus>"),
    if (!is.null(x$ref_upper)) paste0("<c:plus>", to_pml(x$ref_upper), "</c:plus>"),
    "</c:errBars>"
  )
}
