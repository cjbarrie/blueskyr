# Create a logged-in API session object
get_session <- function(method) {
  httr2::request("https://bsky.social/xrpc/com.atproto.server.createSession") |>
  httr2::req_method(method) |>
    httr2::req_body_json(list(
    identifier = Sys.getenv("BSKY_USER"),
    password = Sys.getenv("BSKY_PASS")
  )) |>
    httr2::req_perform() |>
    httr2:: resp_body_json()

  return(session)

}

# This is the token you can use for other API calls:
# session$accessJwt
