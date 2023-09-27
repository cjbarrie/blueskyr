test_that("post_bsky posts data successfully", {

  # Use local_mock to replace get_session and get_request temporarily
  with_mock(
    get_session = function() {
      list(accessJwt = "some_access_token", did = "some_did_value")
    },
    get_request = function(...) {
      list(status_code = 200)
    },
    {
      # Now, run the post_bsky function
      result <- post_bsky("Test post")

      # Check if the result has a status code of 200, which means success
      expect_equal(result$status_code, 200)

      # Optionally, you can add more assertions based on your function's behavior
    }
  )
})
