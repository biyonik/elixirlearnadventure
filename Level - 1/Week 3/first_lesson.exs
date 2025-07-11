# Hedef: Collection processing'de master olmak - map, filter, reduce ve lazy evaluation!

# Enum Nedir?
# Enum = Enumerable (sayılabilir) veri yapıları üzerinde işlem yapma
# List, Map, Range, Set gibi collectionlar üzerinde çalışır
# Eager evaluation - hemen hesaplanır

# Temel sözdizimi
# Enum.function_name(collection, function)


IO.puts(" === ENUM (Enumerable/Sayılabilir) YAPISI ===\n")
IO.puts(" ---> Enum.map/2 - Transformation <---\n")

numbers = [1, 2, 3, 4, 5]

# Basit map
doubled = Enum.map(numbers, fn x -> x * 2 end)
IO.inspect(doubled) # [2, 4, 6, 8, 10]

# Kısa sözdizimi ile
doubled_short_syntax = Enum.map(numbers, &(&1 * 2))
IO.inspect(doubled_short_syntax)

# String transformation
words = ["hello", "world", "elixir"]
uppercased = Enum.map(words, &String.upcase/1)
IO.inspect(uppercased)

# Map transformation with index
with_index = Enum.with_index(words)
indexed_words = Enum.map(with_index, fn {word, index} ->
  "#{index}: #{word}"
end)
IO.inspect(indexed_words)

IO.puts(" ---> Enum.filter/2 - Filtreleme <---\n")

# Sayı dizisi
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Çift sayılar
evens = Enum.filter(numbers, fn x -> rem(x, 2) == 0 end)
IO.puts("Çift sayılar: #{inspect(evens)}")

evens_with_short_syntax = Enum.filter(numbers, &(rem(&1, 2) == 0))
IO.puts("Çift sayılar(kısa sözdizimi): #{inspect(evens_with_short_syntax)}")

# 5'ten büyük sayılar
greater_than_5 = Enum.filter(numbers, &(&1 > 5))
IO.puts("5'ten büyük sayılar: #{inspect(greater_than_5)}")

# String filtreleme
words = ["apple", "banana", "cherry", "date"]
long_words = Enum.filter(words, &(String.length(&1) > 5))
IO.puts("Karakter uzunluğu 5'ten büyük kelimeler: #{inspect(long_words)}")

# Reject (filter'in tersi)
odds = Enum.reject(numbers, &(rem(&1, 2) == 0))
IO.inspect(odds)  # [1, 3, 5, 7, 9]
