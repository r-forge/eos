##----------------------------------------------------------------##
##                         Methods
##----------------------------------------------------------------##

##setGeneric('plot',function(obj,...) standardGeneric('plot'))
setGeneric('plot')

##----------------------------------------------------------------##
##               Constructor for EOSTrackSector
##----------------------------------------------------------------##

EOSTrackSector <- function(obj,order=NULL,length=NULL,width=NULL,scale=NULL,...){
  if(extends(class(obj),'data.frame')){
    if(c('start','end')%in%names(obj)){
      obj <- IRanges(start=obj$start,end=obj$end)
    }else{ if(c('start','width')%in%names(obj)){
      obj <- IRanges(start=obj$start,width=obj$width)
    }else{
      stop('Please specify the start and end/width column!')
    }
         }}else{
           if(!extends(class(obj),'IRanges'))
             stop('Please input a IRanges object')
         }
  if(is.null(order)) order <- 1
  if(is.null(length)) length <- 200
  if(is.null(width)) width <- 50
  if(is.null(scale)) scale <- max(end(obj))

  res <- new('EOSTrackSector',order=order,length=length,width=width,scale=scale,data=obj)
  res
}

setMethod('plot','EOSTrackSector',function(x,...){
##  if(is.null(myscale)) myscale <- max(end(x@data))
  myscale <- x@scale
  paths <- lapply(1:length(x@data),function(i){
    sa <- start(x@data)[i]/myscale*360
    sl <- width(x@data)[i]/myscale*360
    paths <- qglyphSector(0,0,length=x@length,width=x@width,
                         startAngle=sa,sweepLength=sl)
  })
  paintFun <- function(layer,painter){
    qdrawPath(painter,paths,fill='red',stroke=NA)
  }
  scene <- qscene()
  len <- x@length+x@width+20
  layer <- qlayer(scene,paintFun=paintFun,limits=qrect(c(-len,len),c(-len,len)),geometry=qrect(0,0,400,400))
  view <- qplotView(scene)
  view$show()
  list(scene,layer,view)
})

