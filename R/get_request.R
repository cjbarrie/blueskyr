# Post the post
get_request <- function(method) {
  httr2::request("https://bsky.social/xrpc/com.atproto.repo.createRecord") |>
    httr2::req_method(method) |>
    httr2::req_headers(Authorization = paste0("Bearer ", session$accessJwt)) |>
    httr2::req_body_json(list(
      repo = session$did,
      collection = "app.bsky.feed.post",
      record = bsky_post
    )) |>
    httr2::req_perform()
}
