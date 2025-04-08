#' Create a bar plot
#'
#' Create a bar plots for to visualize the distribution of a categorical variable in a data frame.
#' It ensures the input dataset is valid and that the selected column is a factor before plotting.
#'
#' @param dataset A data frame containing the categorical variable.
#' @param x The name of the column to be visualized (as a string).
#' @param x_name A user-friendly label for the x-axis.
#'
#' @return A ggplot2 object displaying the bar plot.
#'
#' @export
#'
#' @examples
#' # example code
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
#' plot <- generate_barplot(dataset = df, x = "class", x_name = "Class")
#'
#' \dontrun{
#' barplot <- generate_barplot(dataset = df, x = "class", x_name = class)
#'
# Function to create a bar plot for the class distribution
#' }
generate_barplot <- function(dataset, x, x_name) {
    # Check if dataset is a data frame
    if (is.null(dataset) || !is.data.frame(dataset)) {
        stop("Dataset must be a data frame!")
    }

    # Check if x column exists in the dataset
    if (!(x %in% names(dataset))) {
        stop(paste("The column", x, "does not exist in the dataset."))
    }

    dataset[[x]] <- as.factor(dataset[[x]])

    class_distribution <- ggplot2::ggplot(dataset, ggplot2::aes(x = !!rlang::sym(x), fill = !!rlang::sym(x))) +
        ggplot2::geom_bar() +
        ggplot2::theme_minimal(base_size = 12) +
        ggplot2::labs(
            title = paste("Distribution of", x_name),
            x = x_name,
            y = "Count"
        ) +
        ggplot2::theme(
            axis.text = ggplot2::element_text(size = 12),
            axis.title = ggplot2::element_text(size = 14),
            plot.title = ggplot2::element_text(size = 16, face = "bold")
        )

    return(class_distribution)
}
