# adapted from https://gist.github.com/andrewheiss/fa6b43cfa94bb11f0c1144b6cb4a0272
#' Function to post to BlueSky
#'
#' @param bsky_text (character) text of the BlueSky post
#'
#' @export httr2
#'
#' @examples
#' \dontrun{
#'
#' post_bsky("This is my first blueskyr post")
#' }
post_bsky <- function(bsky_text) {
  bsky_post <- list(
    "$type" = "app.bsky.feed.post",
    text = bsky_text,
    createdAt = format(as.POSIXct(Sys.time(), tz = "UTC"), "%Y-%m-%dT%H:%M:%OS6Z"),
    langs = list("en-US")
  )

  get_session(method = "POST")
  get_request(method = "POST")

}
