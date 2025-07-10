# DERS 3 - Pattern Matching Derinlemesine + Control Flow

IO.puts("=== Derinlemesine Pattern Matching + Control Flow ===\n")

IO.puts("---> 1.1 - Control Flow")

# Basit case örneği

day = :monday

message_of_the_day = case day do
  :monday -> "Haftanın başlangıcı 😴"
  :tuesday -> "Salı motivasyonu 💪"
  :wednesday -> "Haftanın ortası ⚡"
  :thursday -> "Perşembe enerjisi 🚀"
  :friday -> "Cumaaa! 🎉"
  :saturday -> "Hafta sonu başladı 🎮"
  :sunday -> "Dinlenme günü 😎"
  _ -> "Bilinmeyen gün 🤔"
end

IO.puts("#{day}: #{message_of_the_day}")

# Api cevabı örneği

api_response = {
  :ok,
  %{
    user:  %{
      id: 1,
      full_name: "John Doe",
      username: "johndoe",
      email: "johndoe@example.com",
      premium: true
    }
  }
}

user_info = case api_response do
  {:ok, %{user: user}} ->
    case user do
      %{full_name: name, premium: true} -> "Premium kullanıcı: #{name} ⭐"
      %{full_name: name, premium: false} -> "Standart kullanıcı: #{name} 👤"
      _ -> "Kullanıcı verisi eksik: #{inspect(user)}"
    end

  {:error, reason} -> "Hata: #{reason} ❌"
  _ -> "Bilinmeyen response formatı"
end

IO.puts(user_info)

# Liste Case
numbers = [1, 2, 3, 4, 5]

list_state = case numbers do
  [] -> "Boş liste"
  [tek] -> "Tek eleman: #{tek}"
  [a, b] -> "İki eleman: #{a}, #{b}"
  [head|tail] when length(tail) < 3 -> "Kısa liste: #{head}..."
  [head|tail] -> "Uzun liste: #{head}...(#{length(tail)} eleman daha)"
end

IO.puts("Liste durumu: #{list_state}")

IO.puts("\n=== COND STATEMENTS ===")

# Hava durumu örneği
temperature = 18
is_rainy = false
wind_speed = 5

advice = cond do
  temperature < 0 -> "Çok soğuk! Evde kal ❄️"
  temperature < 10 and is_rainy -> "Soğuk ve yağmurlu, mont al 🧥"
  temperature < 15 -> "Serin hava, hırka yeterli 👕"
  temperature < 25 and not is_rainy -> "İdeal hava, dışarı çık! ☀️"
  temperature < 30 -> "Sıcak ama güzel, hafif giyin 👔"
  temperature >= 30 and wind_speed < 3 -> "Çok sıcak ve rüzgarsız 🥵"
  true -> "Normal hava koşulları 🌤️"
end

IO.puts("Hava durumu tavsiyesi: #{advice}")

# Sınav notu değerlendirme
exam_grade = 85

letter_grade = cond do
  exam_grade >= 90 -> "AA - Mükemmel! 🏆"
  exam_grade >= 80 -> "BA - Çok iyi! 🎉"
  exam_grade >= 70 -> "BB - İyi 👍"
  exam_grade >= 60 -> "CB - Orta 👌"
  exam_grade >= 50 -> "CC - Geçer 😐"
  exam_grade >= 40 -> "DC - Zayıf 😔"
  true -> "FF - Başarısız 💔"
end

IO.puts("#{exam_grade} puan: #{letter_grade}")

IO.puts("\n--- MULTIPLE FUNCTION CLAUSES ---")

defmodule Hesaplayici do
  # Farklı parametre tiplerini kabul eden fonksiyon

  # İki sayı topla
  def topla(a, b) when is_number(a) and is_number(b) do
    a + b
  end

  # Sayı listesi topla
  def topla(liste) when is_list(liste) do
    Enum.sum(liste)
  end

  # String sayıları topla
  def topla(a, b) when is_binary(a) and is_binary(b) do
    {num_a, _} = Integer.parse(a)
    {num_b, _} = Integer.parse(b)
    num_a + num_b
  end

  # Tuple topla
  def topla({a, b}) do
    a + b
  end

  # Default case
  def topla(_, _) do
    {:error, "Desteklenmeyen format"}
  end
end

# Farklı kullanımlar
IO.puts("İki sayı: #{Hesaplayici.topla(5, 3)}")
IO.puts("Liste: #{Hesaplayici.topla([1, 2, 3, 4])}")
IO.puts("String: #{Hesaplayici.topla("10", "20")}")
IO.puts("Tuple: #{Hesaplayici.topla({7, 8})}")

{status, result} = Hesaplayici.topla(:a, :b)
IO.puts("Hata durumu: #{status} - #{result}")

IO.puts("\n--- RECURSIVE FUNCTIONS ---")

defmodule ListeFonksiyonlari do
  # Faktöriyel Hesaplama
  def faktoryel(0), do: 1
  def faktoryel(1), do: 1
  def faktoryel(n) when n > 1 do
    n * faktoryel(n - 1)
  end

  # Fibonacci
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n) when n > 1 do
    fibonacci(n - 1) + fibonacci(n - 2)
  end

  # Liste elemanları çarpma
  def liste_carpim([]), do: 1
  def liste_carpim([head|tail]) do
    head * liste_carpim(tail)
  end

  # Liste içinde arama
  def ara([], _), do: false
  def ara([head | _tail], head), do: true
  def ara([_head | tail], aranan) do
    ara(tail, aranan)
  end

  # Liste filtreleme (pozitif sayılar)
  def pozitif_filtre([]), do: []
  def pozitif_filtre([head | tail]) when head > 0 do
    [head | pozitif_filtre(tail)]
  end
  def pozitif_filtre([_head | tail]) do
    pozitif_filtre(tail)
  end
end


# Recursive function testleri
IO.puts("5! = #{ListeFonksiyonlari.faktoryel(5)}")
IO.puts("Fibonacci(10) = #{ListeFonksiyonlari.fibonacci(10)}")

test_liste = [2, 3, 4, 5]
IO.puts("Liste çarpımı #{inspect(test_liste)}: #{ListeFonksiyonlari.liste_carpim(test_liste)}")

IO.puts("#{inspect(test_liste)} içinde 3 var mı? #{ListeFonksiyonlari.ara(test_liste, 3)}")
IO.puts("#{inspect(test_liste)} içinde 7 var mı? #{ListeFonksiyonlari.ara(test_liste, 7)}")

karisik_liste = [-2, 3, -1, 5, 0, 8, -3]
pozitif_sonuc = ListeFonksiyonlari.pozitif_filtre(karisik_liste)
IO.puts("#{inspect(karisik_liste)} → pozitif: #{inspect(pozitif_sonuc)}")

# === WITH STATEMENTS ===

IO.puts("\n=== WITH STATEMENTS ===")

defmodule FormValidation do
  def register_user_validation(params) do
    with  {:ok, name} <- validate_name(params["name"]),
          {:ok, email} <- validate_email(params["email"]),
          {:ok, password} <- validate_password(params["password"]),
          {:ok, age} <- validate_age(params["age"]) do

            user = %{
              name: name,
              email: email,
              age: age,
              created_at: DateTime.utc_now()
            }

            {:ok, "Kullanıcı başarıyla oluşturuldu!", user}

          else
            {:error, field, reason} ->
              {:error, "#{field}: #{reason}"}

            error ->
              {:error, "Beklenmeyen hata: #{inspect(error)}"}
          end
        end

  defp validate_name(name) when is_binary(name) and byte_size(name) >= 2 do
    clean_name = String.trim(name)
    if String.length(clean_name) >= 2 do
      {:ok, clean_name}
    else
      {:error, "name", "en az 2 karakter olmalı"}
    end
  end
  defp validate_name(_), do: {:error, "name", "geçerli bir isim giriniz"}

  defp validate_email(email) when is_binary(email) do
    clean_email = String.trim(email) |> String.downcase()
    if String.contains?(clean_email, "@") and String.contains?(clean_email, ".") do
      {:ok, clean_email}
    else
      {:error, "email", "geçerli bir email adresi giriniz"}
    end
  end
  defp validate_email(_), do: {:error, "email", "email string olmalı"}

  defp validate_password(pass) when is_binary(pass) and byte_size(pass) >= 6 do
    {:ok, pass}
  end
  defp validate_password(_), do: {:error, "password", "en az 6 karakter olmalı"}

  defp validate_age(age) when is_integer(age) and age >= 13 and age <= 120 do
    {:ok, age}
  end
  defp validate_age(_), do: {:error, "age", "13-120 arası olmalı"}
end

valid_user = %{
  "name" => "Ali Yılmaz",
  "email" => "ali@example.com",
  "password" => "123456",
  "age" => 25
}

case FormValidation.register_user_validation(valid_user) do
  {:ok, message, user} ->
    IO.puts("✅ #{message}")
    IO.inspect(user, label: "Kullanıcı")

  {:error, reason} ->
    IO.puts("❌ Hata: #{reason}")
end

# With statement test - başarısız
invalid_user = %{
  "name" => "A",
  "email" => "invalid-email",
  "password" => "123",
  "age" => 10
}

case FormValidation.register_user_validation(invalid_user) do
  {:ok, message, user} ->
    IO.puts("✅ #{message}")
    IO.inspect(user, label: "Kullanıcı")

  {:error, reason} ->
    IO.puts("❌ Hata: #{reason}")
end
