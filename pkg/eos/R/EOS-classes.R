##----------------------------------------------------------------##
##                     Classes
##----------------------------------------------------------------##


setClassUnion('numericOrNULL',c('numeric','NULL'))

setClass('EOS',contains='VIRTUAL')

setClass('EOSTrack',contains='EOS',
         representation(order='numericOrNULL',
                        length='numericOrNULL',
                        width='numericOrNULL',
                        scale='numericOrNULL'
                        ))

setClass('EOSTrackSector',contains='EOSTrack',
         representation(data='IRanges'))

setClass('QtGraphicPars',representation(pars='environment'),
         prototype(pars=new.env(parent=emptyenv())))

