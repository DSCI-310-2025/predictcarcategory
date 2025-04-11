#' Generate a list of barplots for cateforical features against class
#'
#' This function  creates a eries of bar plots to visualize the relationship
#' between specified cateforical features and a target class variable in a given dataset.
#' Each plot displays the count of observations per feature category, grouped by the class.
#'
#' @param data A data frame containing the target class variable
#' @param features A list of categorical features
#'
#' @return A list of `ggplot` objects, each corresponding to one of the specified features.
#'
#' @export
#'
#' @examples
#' # example code
#' df <- data.frame(
#'     buying = c("vhigh", "vhigh", "vhigh", "vhigh", "vhigh", "low", "med", "low", "med"),
#'     maint = c("vhigh", "vhigh", "vhigh", "vhigh", "vhigh", "low", "low", "med", "med"),
#'     doors = c("2", "2", "2", "2", "2", "3", "3", "4", "5more"),
#'     persons = c("2", "2", "2", "2", "2", "4", "4", "more", "more"),
#'     lug_boot = c("small", "small", "small", "med", "med", "big", "big", "med", "small"),
#'     safety = c("low", "med", "high", "low", "med", "high", "low", "med", "high"),
#'     class = c("unacc", "unacc", "acc", "good", "vgood", "acc", "good", "vgood", "unacc")
#' )
#'
#' category_features <- c("buying", "maint", "doors", "persons", "lug_boot", "safety")
#' plots <- generate_feature_barplots(data = df, features = category_features)
#'
generate_feature_barplots <- function(data, features) {
    # Check if data is a data frame
    if (!is.data.frame(data)) {
        stop("data must be a data frame!")
    }

    # Check if features is a character vector
    if (!is.character(features)) {
        stop("features must be a character vector!")
    }

    # Check if all features exist in the dataset
    missing_features <- setdiff(features, names(data))
    if (length(missing_features) > 0) {
        stop("Missing required columns: ", paste(missing_features, collapse = ", "))
    }

    # Check if class column exists
    if (!"class" %in% names(data)) {
        stop("The dataset must contain a 'class' column!")
    }

    # Check if dataset is empty
    if (nrow(data) == 0) {
        stop("The dataset is empty!")
    }

    # Generate bar plots for each feature
    plot_list <- lapply(features, function(feature) {
        ggplot2::ggplot(data, ggplot2::aes(x = .data[[feature]], fill = .data[["class"]])) +
            ggplot2::geom_bar(position = "dodge") +
            ggplot2::theme_minimal() +
            ggplot2::labs(
                title = paste("Feature Analysis:", feature, "vs. Evaluation Class"),
                x = feature, y = "Count"
            )
    })

    return(plot_list)
}
utils::globalVariables(".data")

