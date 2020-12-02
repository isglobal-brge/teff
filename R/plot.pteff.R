#' Plots inferred treatment effects of individuals from
#' \link[profile]{teff}
#'
#' @param x object of class \code{pteff}
#' @param lb label of the y axis for treatment effect.
#' @return A plot on the current graphics device.
#' @export
#' @examples
#' data(tcell)
#' homologous<- matrix(c("DDX3Y","DDX3X","KDM5D","KDM5C","PRKY","PRKX","RPS4Y1","RPS4X","TXLNGY", "TXLNG", "USP9Y", "USP9X", "XIST", "XIST", "TSIX", "TSIX"), nrow=2)
#' pf <- profile(tcell, featuresinf=homologous)
#' plot(pf)

plot.pteff <- function(x, lb="Associated treatment effect", ...)
{
  if(class(x)!="pteff"){
    stop("x should be of class pteff")
  }

  yrange <- c(x$cl, x$cu)

  colsighigh <-  (x$cl>0)
  colsiglow <- (x$cu<0)

  colsighet <- colsighigh+1
  colsighet[colsighigh==1] <- 3
  colsighet[colsiglow==1] <- 3

  coltreatment <- rep("orange", length(x$treatment))
  coltreatment[x$treatment == 1] <- "blue"

  ranktau <- rank(x$predictions)
  plot(ranktau, x$predictions,
       ylim = c(min(yrange), max(yrange)), type = "p",
       pch = 16, xlab = "Subject Ranking", ylab="",
       col = coltreatment, ...)

  title(ylab=lb, line=2)


  for(i in 1:length(x$predictions))
    lines(c(ranktau[i], ranktau[i]), c(x$cl[i],x$cu[i]), col = colsighet[i])

  points(ranktau, x$predictions, pch = 16,col = coltreatment)

  lines(c(-10,500), c(0,0), lwd=1.5, lty=2, col="red")

  legend("bottomright", c("Not treated", "Treated"), pch=16, col=c("orange","blue"), bty="n" )
  legend("topleft", c("significant"), lty=1, col=3, bty="n" )

}

#' Prints pteff object
#'
#' @param x object of class \code{pteff}
#' @return object of class \code{pteff}
#' @export

print.pteff <- function(x){
  cat("object of class pteff")
  cat("\n individuals with high treatment effect:", nrow(pf$profile$profhigh))
  cat("\n individuals with low treatment effect:", nrow(pf$profile$proflow))
}
