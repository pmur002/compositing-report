
svgSimple <- function(op, alpha=1, suffix="solid") {
    svgfile <- paste0("SVGcompositing/svg-pd-simple-", suffix, "-", op, ".svg")
    pngfile <- paste0("SVGcompositing/svg-pd-simple-", suffix, "-", op, ".png")
    svg <- paste0(
'<?xml version="1.0"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="150" height="150" version="1.1"
     viewBox="0 0 200 200"
     xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <g id="g1">
      <rect x="20" y="20" width="100" height="100" 
            fill="red" fill-opacity="', alpha, '"/>
    </g>
    <g id="g2">
      <rect x="80" y="80" width="100" height="100" 
            fill="blue" fill-opacity="', alpha, '"/>
    </g>
    <filter id="f1" filterUnits="userSpaceOnUse" 
            x="0%" y="0%" width="100%" height="100%">
      <feImage xlink:href="#g1"/>
      <feComposite operator="', op, '" in="SourceGraphic"/>
    </filter>
    <g id="g3">
      <use xlink:href="#g2" filter="url(#f1)"/>
    </g>
  </defs>
  <rect x="0" y="0" width="200" height="200"
        fill="none"
        stroke="black" stroke-opacity="1" stroke-width="1"/>
  <use xlink:href="#g3"/>
</svg>')
    writeLines(svg, svgfile)
    system(paste0("inkscape -e ", pngfile, " ", svgfile))
}

for (i in c("over", "in", "out", "atop", "xor"))
    svgSimple(i)



