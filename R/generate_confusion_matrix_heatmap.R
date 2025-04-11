#' Create a heatmap for confusion matrix
#'
#' @param conf_df A data frame containing the confusion matrix.
#' @param title A custom title for the heatmap plot.
#'
#' @returns A ggplot heatmap object visualizing the confusion matrix.
#' @export
#'
#' @examples
#' conf_df <- data.frame(
#' Prediction = c("unacc", "acc", "good", "vgood"),
#' Reference = c("unacc", "acc", "good", "vgood"),
#' Freq = c(50, 10, 5, 35)
#' )
#' generate_confusion_matrix_heatmap(conf_df)
#'
generate_confusion_matrix_heatmap <- function(conf_df, title = "Confusion Matrix Heatmap") {
    # Check if dataset is a data frame
    if (!is.data.frame(conf_df)) {
        stop("conf_df must be a data frame!")
    }

    # Check if there are missing values
    if (any(is.na(conf_df))) {
        stop("conf_df not allow missing values!")
    }

    # Check if conf_df contains all columns
    cols <- c("Prediction", "Reference", "Freq")
    missing_cols <- setdiff(cols, names(conf_df))
    if (length(missing_cols) > 0) {
        stop("Missing required columns: ", paste(missing_cols, collapse = ", "))
    }

    conf_matrix_heatmap <- ggplot2::ggplot(conf_df, ggplot2::aes(x = Prediction, y = Reference, fill = Freq)) +
      ggplot2::geom_tile() +
      ggplot2::geom_text(ggplot2::aes(label = Freq), color = "black", size = 5) +
      ggplot2::scale_fill_gradient(low = "white", high = "lightblue") +
      ggplot2::labs(title = title, x = "Predicted Class", y = "Actual Class") +
      ggplot2::theme_minimal()

    return(conf_matrix_heatmap)
}
utils::globalVariables(c("Prediction", "Reference", "Freq"))
