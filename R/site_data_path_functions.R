pkg.globals <- new.env()

pkg.globals$site_data_path <- "/home/miquel/OneDrive/Professional/MedfateWorks/MedfateValidation/"

#' Site data path
#'
#' Functions to get/set path to site data
#'
#' @name data_path
#'
#' @param path
#'
#' @export
set_data_path<-function(path) {
  pkg.globals$site_data_path <- path
}

#' @rdname data_path
#' @export
get_data_path<-function(){
  return(pkg.globals$site_data_path)
}
