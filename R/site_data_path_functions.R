pkg.globals <- new.env()

pkg.globals$site_data_path <- "/home/miquel/OneDrive/Professional/Recerca/MedfateValidation/"

set_data_path<-function(path) {
  pkg.globals$site_data_path <- path
}

get_data_path<-function(){return(pkg.globals$site_data_path)}
