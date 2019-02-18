#' violets takes a model and tries to estimate it using OLS instead
#' 
#' @param model a fitted model object
#' @details
#' `violets` tries to extract information from a model object using the
#' `formula` and `model.frame` methods. It will not work on objects that do not
#' conform to this standard.
#' @export
violets <- function(model, ...) {

    f <- tryCatch(stats::formula(model), error = function(e) NULL)
    mf <- tryCatch(stats::model.frame(model), error = function(e) NULL)

    if (is.null(f) | is.null(mf)) {
        msg <- paste0('`violets` does not seem to support models of class ', class(model), '. You might be better off with that fancy model of yours.')
        stop(msg)
    }

    # make sure DV is numeric (this is a terrible hack)
    dv <- as.character(f[2])
    mf[[dv]] <- as.numeric(mf[[dv]])
    
    # ols
    mod <- tryCatch(stats::lm(formula = f, data = mf), error = function(e) NULL)
    
    # be cute
    message('Violets are BLUE. OLS is too.')

    # output
    return(mod)

}
