# Practice - 1
# Easy Level
# Shopping List
# Scenario: "You are developing a web API, you need to handle different response types."
# Topics learned: "Atom patterns, guards with types, HTTP concepts"

defmodule ApiResponseHandler do
  def process_response(response) do
    case response do
      {:ok, data} when is_binary(data) ->
        "Success (string): #{data}"

      {:ok, data} when is_number(data) ->
        "Success (number): #{data}"

      {:ok, data} when is_list(data) ->
        "Success (list). There are #{length(data)} more items"

      {:ok, data} ->
        "Success (other): #{inspect(data)}"

      {:error, reason} when is_binary(reason) ->
        "Error! #{reason}"

      {:error, code} when is_integer(code) ->
        "Error! Code is: #{code}"

      {:loading} -> "Loading..."

      {:timeout} -> "Timeout..."

      _ -> "Undefined response type!"
    end
  end

  def process_http_status(status_code) do
    case status_code do
      200 -> {:ok, "Success"}
      201 -> {:ok, "Created"}
      404 -> {:error, "Not Found!"}
      401 -> {:error, "Unauthentication access!"}
      500 -> {:error, "Server Error!"}
      code when code >= 200 and code < 300 -> {:ok, "Success (#{code})"}
      code when code >= 400 and code < 500 -> {:error, "Client error (#{code})"}
      code when code >= 500 -> {:error, "Server error (#{code})"}
      _ -> {:error, "Unknown status"}
    end
  end
end




responses = [
  {:ok, "User found!"},
  {:ok, 42},
  {:ok, ["user1", "user2", "user3"]},
  {:error, "User not found!"},
  {:error, 404},
  {:loading},
  {:timeout},
  {:unknown, "test"}
]

IO.puts("=== API Response Tests ===")
for response <- responses do
  result = ApiResponseHandler.process_response(response)
  IO.puts("#{inspect(response)} → #{result}")
end

IO.puts("\n=== HTTP Status Tests ===")
status_codes = [200, 201, 404, 401, 500, 301, 418, 999]
for code <- status_codes do
  {status, message} = ApiResponseHandler.process_http_status(code)
  IO.puts("#{code} → #{status}: #{message}")
end
