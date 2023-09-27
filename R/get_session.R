#' Create a logged-in API session object
#' @return A list containing session details
get_session <- function() {
  session <- httr2::request("https://bsky.social/xrpc/com.atproto.server.createSession") |>
    httr2::req_method("POST") |>
    httr2::req_body_json(list(
      identifier = Sys.getenv("BSKY_USER"),
      password = Sys.getenv("BSKY_PASS")
    )) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  if (is.null(session$accessJwt)) {
    stop("Failed to get a valid session")
  }

  return(session)
}
