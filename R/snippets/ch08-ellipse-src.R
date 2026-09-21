ellipse <- function(center = c(0, 0), radius = c(2, 1), alpha = 0,
                    npoints = 100, add = FALSE, ...) {
  theta <- seq(0, 2*pi, length = npoints + 1)
  x0 <- radius[1]*cos(theta);  y0 <- radius[2]*sin(theta)
  x <- x0*cos(alpha) - y0*sin(alpha) + center[1]
  y <- x0*sin(alpha) + y0*cos(alpha) + center[2]
  LongAxis <- max(radius)
  xlm <- center[1] + c(-1, 1)*LongAxis
  ylm <- center[2] + c(-1, 1)*LongAxis
  if (add) lines(x, y, xlim = xlm, ylim = ylm, ...)
  else     plot(x, y, xlim = xlm, ylim = ylm, type = "l", ...)
  invisible(cbind(x, y))
}
