qglyphSector <- function(x,y,length,width,startAngle,sweepLength){
  len <- (length+width)*2
  r <- length+width
  x0 <- x-r
  y0 <- y-r
  glyph <- Qt$QPainterPath()
  movex <- x+r*cos(startAngle/180*pi)
  movey <- y-r*sin(startAngle/180*pi)
  glyph$moveTo(movex,movey)
  glyph$arcTo(x0,y0,len,len,startAngle,sweepLength)
  r <- r-width
  x0 <- x-r
  y0 <- y-r
  movex <- x+r*cos(startAngle/180*pi)
  movey <- y-r*sin(startAngle/180*pi)
  glyph$arcTo(x0,y0,2*r,2*r,startAngle+sweepLength,-sweepLength)
  glyph$closeSubpath()
  glyph
}
