#' Post the post
#' @param session A list containing session details
#' @param bsky_post The post data to be sent to BlueSky
get_request <- function(session, bsky_post) {
  resp <- httr2::request("https://bsky.social/xrpc/com.atproto.repo.createRecord") |>
    httr2::req_method("POST") |>
    httr2::req_headers(Authorization = paste0("Bearer ", session$accessJwt)) |>
    httr2::req_body_json(list(
      repo = session$did,
      collection = "app.bsky.feed.post",
      record = bsky_post
    )) |>
    httr2::req_perform()

  if (resp$status_code >= 400) {
    stop("Failed to post to BlueSky")
  }

  return(resp)
}
