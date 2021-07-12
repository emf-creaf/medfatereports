#' Report generation function
#'
#' Function for generating automatically the report
#'
#' The parameters accepted by the rmarkdown template (\code{...} argument) are
#' the following:
#' \itemize{
#'   \item{wd: working directory (i.e. the route to the validation root folder)}
#'   \item{code: Site/Plot code for which the report must be generated}
#'   \item{model: Simulation model, either "spwb" or "growth"}
#'   \item{conf: Control configuration}
#' }
#'
#' @param type which kind of report must be generated, "evaluation"
#' @param output_file file name for the output report
#' @param output_dir destination folder (if it does not exist, it will be
#'   created)
#' @param ... Rmarkdown parameters
report_render <- function(type = 'evaluation',
                          output_file = NULL, output_dir = NULL, ...) {

  # check if directory to save the report exists and if not, create it
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  if (type == 'evaluation') {
    # render the template with the code indicated in the ... argument
    rmarkdown::render(input = system.file("Rmd_templates", "evaluation_report_template.Rmd",
                                          package = "medfatereports"),
                      output_format = c('html_document'),
                      output_file = output_file,
                      output_dir = output_dir,
                      runtime = 'auto',
                      clean = TRUE,
                      params = list(...),
                      run_pandoc = TRUE,
                      quiet = TRUE)
  }
}

#' Main function to run reports
#'
#' Runs reports for a set of sites under a set of configurations
#'
#' @param type which kind of report must be generated, "evaluation"
#' @param sites A character vector with the sites codes
#' @param wd Complete path to the validation directory
#' @param model A string with the model to be run ("spwb" or "growth")
#' @param confs A character vector with names of configuration (control) settings
#'
#' @export
run_reports <- function(type = 'evaluation',
                        sites, model, confs,
                        wd = getwd()) {

  for(conf in confs) {
    for (code in sites) {
      report_name <- file.path('Output', packageVersion('medfate')[[1]],
                               code,
                               model, conf, code,
                               paste0(code, "_", type, '_report.html'))

      report_folder <- file.path('Output', packageVersion('medfate')[[1]],
                                 model, conf, code)

      report_render(type, report_name, report_folder,
                    wd = wd, code = code, model = model, conf = conf)
    }
  }
}

