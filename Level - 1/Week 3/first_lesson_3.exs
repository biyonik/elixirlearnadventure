# Hedef: Collection processing'de master olmak - map, filter, reduce ve lazy evaluation!

# Enum Nedir?
# Enum = Enumerable (sayılabilir) veri yapıları üzerinde işlem yapma
# List, Map, Range, Set gibi collectionlar üzerinde çalışır
# Eager evaluation - hemen hesaplanır

# Temel sözdizimi
# Enum.function_name(collection, function)

IO.puts(" === ENUM (Enumerable/Sayılabilir) YAPISI ===\n")
IO.puts(" ---> Enum Pipeline Patterns <---\n")

# Birden fazla Enum operation'ı pipe ile
numbers = 1..20

result = numbers
|> Enum.filter(&(rem(&1, 2) == 0)) # Çift sayılar
|> Enum.map(&(&1 * &1)) # Karelerini al
|> Enum.filter(&(&1 > 100)) # 100'den büyükler
|> Enum.take(3) # İlk 3 tane al
|> Enum.sum() # Toplamını al

IO.puts("Pipeline sonucu: #{result}")


# Daha kompleks örnek - word processing
text = "Merhaba güzel dünya. Elixir harika bir dil!"

word_analysis = text
|> String.split(~r/[^\w]/, trim: true) # Kelimelere böl
|> Enum.map(&String.downcase/1) # Küçük harfe
|> Enum.filter(&(String.length(&1) > 3)) # 3 harften uzun olanlar
|> Enum.map(&{&1, String.length(&1)}) # {kelime, uzunluk} demeti yap
|> Enum.sort_by(&elem(&1, 1), :desc) # Uzunluğa göre sırala
|> Enum.take(3) # En uzun 3 kelime

IO.inspect(word_analysis)


IO.puts(" ---> Enum ile Gruplama ve Sıralama <---\n")

students = [
  %{name: "Ali", grade: 85, class: "A"},
  %{name: "Ayşe", grade: 92, class: "B"},
  %{name: "Mehmet", grade: 78, class: "A"},
  %{name: "Fatma", grade: 88, class: "B"},
  %{name: "Can", grade: 95, class: "A"}
]

# Sınıfa göre grupla
grouped_by_class = Enum.group_by(students, &(&1.class))
IO.puts("Sınıfa göre gruplanmış öğrenci verileri: #{inspect(grouped_by_class)}")

# Nota göre gruplama
grouped_by_grade = Enum.group_by(students, fn student ->
  cond do
    student.grade >= 90 -> "A"
    student.grade >= 80 -> "B"
    student.grade >= 70 -> "C"
    true -> "F"
  end
end)
IO.puts("Nota göre gruplanmış öğrenci verileri: #{inspect(grouped_by_grade)}")

# Nota göre sıralı
sorted_by_grade = Enum.sort_by(students, &(&1.grade), :desc)
IO.puts("Nota göre sıralı: #{inspect(sorted_by_grade)}")

# Complex sorting - önce sınıfa, sonra nota göre
sorted_complex = Enum.sort_by(students, &{&1.class, -&1.grade})
IO.inspect(sorted_complex, label: "Karmaşık sıralama")

# Sınıf başarı ortalamaları
class_averages = grouped_by_class
|> Enum.map(fn {class, students_in_class} ->
  average = students_in_class
  |> Enum.map(&(&1.grade))
  |> Enum.sum()
  |> Kernel./(length(students_in_class))

  {class, Float.round(average, 2)}
end)
|> Enum.into(%{})

IO.inspect(class_averages, label: "Sınıf ortalamaları")
