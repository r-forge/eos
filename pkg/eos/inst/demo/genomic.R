library(qtpaint)
library(IRanges)
options(warn=2)
options(error=recover)

sourceDir <- function(path, trace = TRUE, ...) {
         for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
            if(trace) cat(nm,":")           
            source(file.path(path, nm), ...)
            if(trace) cat("\n")
         }
      }

sourceDir('~/Prolang/svn/repos/trunk/eos/pkg/EOS/R')

ir <- IRanges(start=c(100,300),end=c(200,400))
myobj <- EOSTrackSector(ir)
plot(myobj)

length(myobj@data)
