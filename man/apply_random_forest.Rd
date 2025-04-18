% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_model.R
\name{apply_random_forest}
\alias{apply_random_forest}
\title{Function that applies RandomForest algorithm to the dataset, returns the confusion matrix}
\usage{
apply_random_forest(df)
}
\arguments{
\item{df}{a dataframe}
}
\value{
a confusin matrix based on the RandomForest model
}
\description{
Function that applies RandomForest algorithm to the dataset, returns the confusion matrix
}
\examples{
#example
df_balanced <- tibble::tibble(
   class = factor(sample(c("A", "B"), 100, replace = TRUE)),
   var1 = rnorm(100),
   var2 = runif(100)
 )
conf_mat <- apply_random_forest(df_balanced)

\dontrun{
apply_random_forest(2048)
}
}
