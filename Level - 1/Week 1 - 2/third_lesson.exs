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

# Farklı parametreler için farklı fonksiyon tanımları
# Elixir hangi pattern uyuyorsa onu çalıştırır

defmodule Greetings do
  # String alan versiyon
  def selamla(name) when is_binary(name) do
    "Merhaba #{name}"
  end

  # Atom alan versiyon
  def selamla(name) when is_atom(name) do
    "Merhaba #{Atom.to_string(name)}!"
  end

  # Tuple alan versiyon
  def selamla({first_name, last_name}) do
    "Merhaba #{first_name} #{last_name}"
  end

  #Liste alan versiyon
  def selamla(names) when is_list(names) do
    "Merhaba " <> Enum.join(names, ", ") <> "!"
  end

  # Default case
  def selamla(_) do
    "Merhaba bilinmeyen kişi"
  end
end

# Farklı kullanımlar - aynı fonksiyon adı!
IO.puts(Greetings.selamla("Ali"))              # String
IO.puts(Greetings.selamla(:mehmet))            # Atom
IO.puts(Greetings.selamla({"Ayşe", "Yılmaz"})) # Tuple
IO.puts(Greetings.selamla(["Can", "Cem"]))     # Liste
IO.puts(Greetings.selamla(123))                # Catch-all

IO.puts("\n=== Recursive Functions ile Pattern Matching ===\n")

defmodule ListeIslemler do
  # Boş liste için base case
  def toplam([]) do
    0
  end

  # En az bir elemanlı liste için recursive case
  def toplam([head | tail]) do
    head + toplam(tail)
  end

  # Liste uzunluğu
  def uzunluk([]) do
    0
  end

    def uzunluk([_head | tail]) do
    1 + uzunluk(tail)
  end

  # Liste ters çevirme
  def ters_cevir(liste) do
    ters_cevir(liste, [])
  end

  # Helper func. (accumulator pattern)
  defp ters_cevir([], acc) do
    acc
  end

  defp ters_cevir([head | tail], acc) do
    ters_cevir(tail, [head | acc])
  end
end

sayilar = [1, 2, 3, 4, 5]
IO.puts("Toplam: #{ListeIslemler.toplam(sayilar)}")        # 15
IO.puts("Uzunluk: #{ListeIslemler.uzunluk(sayilar)}")      # 5
IO.inspect(ListeIslemler.ters_cevir(sayilar), label: "Ters") # [5,4,3,2,1]

IO.puts("\n=== Guard'lı Multiple Function Clauses ===\n")

defmodule SayiAnaliz do
  # Pozitif Sayılar
  def analiz(sayi) when sayi > 0 do
    cond do
      rem(sayi, 2) == 0 -> "Pozitif çift sayı: #{sayi}"
      true -> "Pozitif tek sayı: #{sayi}"
    end
  end

  # Sıfır
  def analiz(0) do
    "Sıfır - ne pozitif ne negatif"
  end

  # Negatif sayılar
  def analiz(sayi) when sayi < 0 do
    cond do
      rem(sayi, 2) == 0 -> "Negatif çift sayı: #{sayi}"
      true -> "Negatif tek sayı: #{sayi}"
    end
  end

  def analiz(_) do
    "Bu bir sayı değil!"
  end
end

IO.puts(SayiAnaliz.analiz(6))    # Pozitif çift
IO.puts(SayiAnaliz.analiz(7))    # Pozitif tek
IO.puts(SayiAnaliz.analiz(0))    # Sıfır
IO.puts(SayiAnaliz.analiz(-4))   # Negatif çift
IO.puts(SayiAnaliz.analiz("a"))  # Sayı değil
