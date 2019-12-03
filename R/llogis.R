#    Copyright 2015 Province of British Columbia
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

#' Log-Logistic Distribution
#'
#' Density, distribution function, quantile function, random generation
#' and starting values for the
#' log-logistic distribution
#' with \code{shape} and \code{scale} parameters.
#'
#' The functions are wrappers to export the identical functions from the FAdist package.
#'
#' @param x A numeric vector of values.
#' @inheritParams params
#' @return A numeric vector.
#' @name llogis
#' @seealso \code{\link[stats]{dlogis}}
#' @examples
#' x <- seq(0.01, 5, by = 0.01)
#' plot(x, dllogis(x), type = "l")
NULL

#' @rdname llogis
#' @export
dllogis <- function(x, shapelog = 0, scalelog = 1, log = FALSE) {
  if(!length(x)) return(numeric(0))
  d <- dlogis(log(x), location = exp(scalelog), scale = exp(shapelog)) / x
  if(log) return(log(d))
  d
}

#' @rdname llogis
#' @export
qllogis <- function(p, shapelog = 0, scalelog = 1, lower.tail = TRUE, log.p = FALSE) {
  if(log.p) p <- exp(p)
  if(!lower.tail) p <- 1 - p
  exp(qlogis(p, location = exp(scalelog), scale = exp(shapelog)))
}

#' @rdname llogis
#' @export
pllogis <- function(q, shapelog = 0, scalelog = 1, lower.tail = TRUE, log.p = FALSE) {
  plogis(log(q), location = exp(scalelog), scale = exp(shapelog), lower.tail = lower.tail, log.p = log.p)
}

#' @rdname llogis
#' @export
rllogis <- function(n, shapelog = 0, scalelog = 1) {
  exp(rlogis(n = n, location = exp(scalelog), scale = exp(shapelog)))
}

#' @rdname llogis
#' @export
sllogis <- function(x) {
  c(
    scalelog = mean(log(x), na.rm = TRUE),
    shapelog = pi * sd(log(x), na.rm = TRUE) / sqrt(3)
  )
}