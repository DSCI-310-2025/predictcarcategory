% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_barplot.R
\name{generate_barplot}
\alias{generate_barplot}
\title{Create a bar plot}
\usage{
generate_barplot(dataset, x, x_name)
}
\arguments{
\item{dataset}{A data frame containing the categorical variable.}

\item{x}{The name of the column to be visualized (as a string).}

\item{x_name}{A user-friendly label for the x-axis.}
}
\value{
A ggplot2 object displaying the bar plot.
}
\description{
Create a bar plots for to visualize the distribution of a categorical variable in a data frame.
It ensures the input dataset is valid and that the selected column is a factor before plotting.
}
\examples{
# example code
# example code
df <- data.frame(
    buying = c("vhigh", "vhigh", "vhigh", "vhigh", "vhigh", "low", "med", "low", "med"),
    maint = c("vhigh", "vhigh", "vhigh", "vhigh", "vhigh", "low", "low", "med", "med"),
    doors = c("2", "2", "2", "2", "2", "3", "3", "4", "5more"),
    persons = c("2", "2", "2", "2", "2", "4", "4", "more", "more"),
    lug_boot = c("small", "small", "small", "med", "med", "big", "big", "med", "small"),
    safety = c("low", "med", "high", "low", "med", "high", "low", "med", "high"),
    class = c("unacc", "unacc", "acc", "good", "vgood", "acc", "good", "vgood", "unacc")
)

plot <- generate_barplot(dataset = df, x = "class", x_name = "Class")

\dontrun{
barplot <- generate_barplot(dataset = df, x = "class", x_name = class)

}
}
