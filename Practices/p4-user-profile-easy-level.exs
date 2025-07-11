# Practice - 1
# Easy Level
# Shopping List
# Scenario: "Social media application, you are processing user profiles."
# Topics learned: "Map pattern matching, nested maps, map_size function"

defmodule UserProfile do

  def profile_summary(profile) do
    case profile do
      %{name: name, age: age} when age >= 18 ->
        "Adult user: #{name} and age is #{age}"

      %{name: name, age: age} when age < 18 ->
        "Young user: #{name} and age is #{age}"

      %{name: name} ->
        "User: #{name}. (age not provided)"

      %{email: email} ->
        "Noname user: #{email}"

      _ ->
        "Undefined profile data!"
    end
  end

  def account_type(profile) do
    case profile do
      %{premium: true, name: name} ->
         "⭐ Premium: #{name}"

      %{premium: false, name: name} ->
        "👤 Standart: #{name}"

      %{name: name} ->
        "👤 Standart: #{name} (premium unspecified)"

      _ ->
        "❓ Unknown account"
    end
  end

  def social_media_control(profile) do
    case profile do
      %{social: %{twitter: twitter, instagram: instagram}} ->
        "Twitter: @#{twitter}, Instagram: @#{instagram}"

      %{social: %{twitter: twitter}} ->
        "Only Twitter: @#{twitter}"

      %{social: %{instagram: instagram}} ->
        "Only Instagram: @#{instagram}"

      %{social: social_map} when map_size(social_map) == 0 ->
        "Doesn't have a social media accounts!"

      _ ->
        "Doesn't available social media section."
    end
  end
end


user1 = %{name: "John Doe", age: 28, premium: true}
user2 = %{name: "Jane Doe", age: 16, premium: false}
user3 = %{name: "Alice Martin"}
user4 = %{name: "john@doe.com"}

user_with_social = %{
  name: "Benjamin Jamin",
  age: 25,
  social: %{
    twitter: "jamin_benjamin",
    instagram: "jamintagram"
  }
}

users = [user1, user2, user3, user4, user_with_social]

IO.puts("=== Profile Summary ===")
for user <- users do
  summary = UserProfile.profile_summary(user)
  type = UserProfile.account_type(user)
  social = UserProfile.social_media_control(user)

  IO.puts("Summary: #{summary}")
  IO.puts("Type: #{type}")
  IO.puts("Social: #{social}")
  IO.puts("---")
end
