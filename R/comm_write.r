### S3 tool function for writing.

comm.write <- function(x, file = "data",
    ncolumns = if(is.character(x)) 1 else 5,
    append = FALSE, sep = " ", comm = .SPMD.CT$comm){
  comm.rank <- spmd.comm.rank(comm = comm)

  if(comm.rank != 0){
    append <- TRUE
  }
  for(i in 0:(spmd.comm.size(comm = comm) - 1)){
    if(comm.rank == i){
      write(x, file = file, ncolumns = ncolumns, append = append, sep = sep)
    }
    spmd.barrier(comm = comm)
  }
  invisible()
} # End of comm.write().

comm.write.table <- function(x, file = "", append = FALSE,
    quote = TRUE, sep = " ", eol = "\n", na = "NA", dec = ".",
    row.names = TRUE, col.names = TRUE, qmethod = c("escape", "double"),
    fileEncoding = "", comm = .SPMD.CT$comm){
  comm.rank <- spmd.comm.rank(comm = comm)

  if(comm.rank != 0){
    append <- TRUE
  }
  for(i in 0:(spmd.comm.size(comm = comm) - 1)){
    if(comm.rank == i){
      write.table(x, file = file, append = append, quote = quote, sep = sep,
                  eol = eol, na = na, dec = dec, row.names = row.names,
                  col.names = col.names, qmethod = qmethod,
                  fileEncoding = fileEncoding, comm = comm)
    }
    spmd.barrier(comm = comm)
  }
  invisible()
} # End of comm.write.table().
     
comm.write.csv <- function(..., comm = .SPMD.CT$comm){
  comm.rank <- spmd.comm.rank(comm = comm)

  if(comm.rank != 0){
    append <- TRUE
  }

  for(i in 0:(spmd.comm.size(comm = comm) - 1)){
    if(comm.rank == i){
      write.csv(..., append = append, comm = comm)
    }
    spmd.barrier(comm = comm)
  }
  invisible()
} # End of comm.write.csv().

comm.write.csv2 <- function(..., comm = .SPMD.CT$comm){
  comm.rank <- spmd.comm.rank(comm = comm)

  if(comm.rank != 0){
    append <- TRUE
  }

  for(i in 0:(spmd.comm.size(comm = comm) - 1)){
    if(comm.rank == i){
      write.csv2(..., append = append, comm = comm)
    }
    spmd.barrier(comm = comm)
  }
  invisible()
} # End of comm.write.csv2().

