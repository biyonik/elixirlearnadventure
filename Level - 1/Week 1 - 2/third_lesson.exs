# Hedef: Pattern Matching ustalaşma ve karar verme mekanizmaları

# Case Statements (Durum Kontrolleri)
# Case Nedir?
# case = 'duruma göre ne yapacağım'
# Farklı patternlere göre farklı işlemler
# switch-case benzeri ama daha güçlü

IO.puts("=== Case İle Karar Verme Mekanizması ===\n")

state = :ok

result = case state do
  :ok -> "Herşey yolunda!"
  :error -> "Hata oluştu!"
  _ -> "Bilinmeyen durum"
end

IO.puts("Durum: #{state}")
IO.puts("Sonuç: #{result}")

# Sayılar ile karar verme mekanizması
number = 5

result = case number do
  1 -> "Bir"
  2 -> "İki"
  3 -> "Üç"
  n when n > 10 -> "Sayı 10'dan büyüktür: #{n}"
  n when n > 0 -> "Sayı pozitif bir sayıdır: #{n}"
  0 -> "Sıfır"
  _ -> "Negatif sayı"
end

IO.puts("Sayı: #{number}\t\nKoşul sonucu: #{result}")

IO.puts("=== Case İle Tuple Pattern Matching ===\n")
# Case ile Tuple Pattern Matching
api_response = {
  :ok,
  %{
    name: "Ahmet",
    username: "ahmetaltun",
    email: "ahmet.altun60@gmail.com",
    roles: ["admin", "moderator"]
  }
}

sonuc = case api_response do
  {:ok, %{name: name, username: username}} -> "Kullanıcı #{name}, kullanıcı adı: #{username}"
  {:ok, data} -> "İşlem başarılı ama beklenmeyen format: #{inspect(data)}"
  {:error, reason} -> "Hata oluştu! Reason: #{reason}"
  _ -> "Bilinmeyen durum!"
end

IO.puts(sonuc) # Kullanıcı Ahmet, kullanıcı adı: ahmetaltun

IO.puts("=== Case İle List Pattern Matching ===\n")
# Case ise List Pattern Matching
numbers = [1, 2, 3, 4, 5]

sonuc = case numbers do
  [] -> "Boş liste"
  [single_item] -> "Tek elemanlı liste: #{single_item}"
  [first, second] -> "İki elemanlı liste: #{first}, #{second}" # İki elemanlı liste: 1, 2
  [head | tail] -> "En baştaki eleman: #{head}, diğerleri: #{inspect(tail)}" # En baştaki eleman: 1, diğerleri: [2, 3, 4, 5]
end

IO.puts(sonuc) # En baştaki eleman: 1, diğerleri: [2, 3, 4, 5]

IO.puts("=====================================\n")
IO.puts("=== Cond Statements (Koşul Kontrolleri) ===\n")

# cond = 'hangi koşul doğruysa onu yap'
# if-else if-else zinciri gibi
# İlk true olan koşul çalışır

number = 15

result = cond do
  number < 0 -> "Negatif"
  number == 0 -> "Sıfır"
  number < 10 -> "Tek haneli pozitif"
  number < 100 -> "Çift haneli pozitif"
  true -> "Çok büyük sayı" # default case
end

IO.puts("Koşul sonucu: #{result}") # Koşul sonucu: Çift haneli pozitif

# cond ile kompleks koşullar

sicaklik = 22
nem = 60
ruzgar = 5

hava_durumu = cond do
  sicaklik > 30 and nem > 70 -> "Çok sıcak ve nemli"
  sicaklik > 25 and ruzgar < 3 -> "Sıcak ve rüzgarsız"
  sicaklik < 5 and ruzgar > 10 -> "Soğuk ve rüzgarlı"
  sicaklik >= 15 and sicaklik <= 25 -> "İdeal hava"
  true -> "Normal hava koşulları"
end

IO.puts(hava_durumu <> "\n")  # "İdeal hava"

IO.puts("=== Function Pattern Matching (Multiple Clauses) ===\n")
