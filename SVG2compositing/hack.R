
## Remove Source and Dest and shrink image

library(xml2)

hack <- function(op) {
    infile <- paste0("PD_", op, ".svg")
    outfile <- paste0("PD_", op, "-hack.svg")
    svg <- read_xml(infile)
    ns <- xml_ns(svg)
    xml_ns_strip(svg)
    srcdst <- xml_find_all(svg, "/svg/g/g")[1:2]
    xml_remove(srcdst)
    root <- xml_find_first(svg, "/svg")
    xml_set_attr(svg, "viewBox", "260, 0, 140, 140")
    xml_set_attr(svg, "width", "140")
    xml_set_attr(svg, "xmlns", ns[1])
    write_xml(svg, outfile)
}

for (i in c("src-over", "clr", "src", "src-in", "src-out", "src-atop",
            "dst", "dst-over", "dst-in", "dst-out", "dst-atop", "xor")) {
    hack(i)
}
