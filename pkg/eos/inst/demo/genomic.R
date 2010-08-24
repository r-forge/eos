library(qtpaint)
library(IRanges)
options(warn=0)
## options(error=recover)

sourceDir <- function(path, trace = TRUE, ...) {
         for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
            if(trace) cat(nm,":")           
            source(file.path(path, nm), ...)
            if(trace) cat("\n")
         }
      }

sourceDir('~/Prolang/svn/repos/trunk/eos/pkg/eos/R')
load('~/Prolang/svn/repos/trunk/eos/pkg/eos/data/cytobands.rda')
obj <- cytobands[[1]]
lst <- by(obj,obj$chr,function(x) data.frame(chr=unique(x$chr),start=min(x$start),end=max(x$end)))
mydf <- do.call('rbind',lst)
ir <- IRanges(start=mydf$start,end=mydf$end)
ird <- RangedData(ir,space=mydf$chr)
.TYPES <- c('sector','segment')


eostest <- EOSTrack(ird,type='sector')
eosview <- EOSView(list(eostest,eostest,eostest),scale=max(end(ird)))


plot(eosview)




