# Hedef: Collection processing'de master olmak - map, filter, reduce ve lazy evaluation!

# Enum Nedir?
# Enum = Enumerable (sayılabilir) veri yapıları üzerinde işlem yapma
# List, Map, Range, Set gibi collectionlar üzerinde çalışır
# Eager evaluation - hemen hesaplanır

# Temel sözdizimi
# Enum.function_name(collection, function)

IO.puts(" === ENUM (Enumerable/Sayılabilir) YAPISI ===\n")
IO.puts(" ---> Enum.reduce/3 - Aggregation <---\n")

# Collection'u tek bir değere indirgeme
numbers = [1, 2, 3, 4, 5]

# Toplam hesaplama
sum = Enum.reduce(numbers, 0, fn x, acc -> x + acc end)
IO.puts("Toplam: #{sum}")

sum_short_syntax = Enum.reduce(numbers, 0, &(&1 + &2))
IO.puts("Toplam (kısa sözdizimi): #{sum_short_syntax}")

# Çarpım hesaplama
product = Enum.reduce(numbers, 1, &(&1 * &2))
IO.puts("Çarpım: #{product}")

# String birleştirme
words = ["Hello", "beautiful", "world"]
sentence = Enum.reduce(words, "", fn word, acc ->
  if acc == "", do: word, else: acc <> " " <> word
end)

IO.puts(sentence)

# Kompleks reduce - maximum bulma
max_number = Enum.reduce(numbers, fn x, acc ->
  if x > acc, do: x, else: acc
end)

IO.puts("En büyük: #{max_number}")

word_counts = Enum.reduce(words, %{}, fn word, acc ->
  Map.update(acc, word, 1, &(&1 + 1))
end)
IO.inspect(word_counts)


IO.puts(" ---> Enum.find/3 - Aggregation <---\n")

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# İlk çift sayıyı bul
first_even = Enum.find(numbers, &(rem(&1, 2) == 0))
IO.puts("İlk çift sayı: #{first_even}")

# Default value ile
first_big = Enum.find(numbers, 999, &(&1 > 15))
IO.puts("15'ten büyük ilk sayı: #{first_big}")  # 999 (bulunamadı)

# Koşula uyan elemanın index'ini bul
index_of_5 = Enum.find_index(numbers, &(&1 == 5))
IO.puts("5'in index'i: #{index_of_5}")  # 4

# Koşula uyan eleman var mı?
has_big_number = Enum.any?(numbers, &(&1 > 5))
IO.puts("5'ten büyük sayı var mı? #{has_big_number}")  # true

# Tüm elemanlar koşulu sağlıyor mu?
all_positive = Enum.all?(numbers, &(&1 > 0))
IO.puts("Hepsi pozitif mi? #{all_positive}")  # true
