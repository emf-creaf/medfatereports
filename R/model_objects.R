#' Building model objects functions
#'
#' This functions create the objects needed for the model runs
#'
#' @family ModelObjects
#'
#' @param treeData tree data dataframe
#' @param shrubData shrub data dataframe
#' @param seedData seed bank data dataframe
#' @param miscData miscelaneous data dataframe
#'
#' @export

buildForest <- function(treeData = NULL, shrubData = NULL,
                        seedData = NULL, miscData = NULL) {

  # empty forest object
  empty_forest <- medfate::emptyforest()

  # adding tree data
  if (!is.null(treeData)) {
    empty_forest$treeData <- treeData
  }

  # adding shrub data
  if (!is.null(shrubData)) {
    empty_forest$shrubData <- shrubData
  }

  # adding seed data
  if (!is.null(seedData)) {
    empty_forest$seedBank <- seedData
  }

  # adding misc data
  if (!is.null(miscData)) {
    empty_forest$ID <- miscData$ID
    empty_forest$patchsize <- miscData$patchsize
    empty_forest$herbCover <- miscData$herbCover
    empty_forest$herbHeight <- miscData$herbHeight
  }

  # return the forest object
  return(empty_forest)
}
