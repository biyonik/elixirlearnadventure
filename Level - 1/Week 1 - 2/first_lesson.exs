
# Yorum satırları
# Bu bir yorum satırıdır. Kodun çalışmasını etkilemez.
# Yorum satırı '#' karakteri ile başlar.

# IO ve IO.puts nedir?
# IO, Elixir'de girdi/çıktı işlemleri için kullanılan bir modüldür.
# IO.puts, konsola çıktı yazdırmak için kullanılır.

IO.puts("Merhaba, Elixir!\n") # Konsola "Merhaba, Elixir!" yazdırır.

IO.puts("=== Sayılar ve Matematiksel İşlemler (Numbers and Mathematical Operations) ===\n")

# Sayılar
# Elixir'de sayılar, tamsayılar (integers) ve kayan noktal sayılar (floats) olarak ikiye ayrılır.

# Tamsayılar
firstNumber = 10
secondNumber = 20

sum = firstNumber + secondNumber
IO.puts("Toplam: #{sum}\n")

# Kayan Noktalı Sayılar
firstFloat = 10.5
secondFloat = 20.5

floatSum = firstFloat + secondFloat
IO.puts("Kayan Noktalı Toplam: #{floatSum}\n")

extraction = 100 - 50
IO.puts("Çıkarma: #{extraction}\n")

multiplication = 10 * 5
IO.puts("Çarpma: #{multiplication}\n")

division = 100 / 5
IO.puts("Bölme: #{division}\n")

IO.puts("=== Metinler (Strings) ===\n")

firstName = "Ahmet"
lastName = "Altun"
fullName = firstName <> " " <> lastName
IO.puts("Tam İsim: #{fullName}\n")

age = 35
message = "Merhaba, benim adım #{fullName} ve yaşım #{age}."
IO.puts(message)

IO.puts("=== Atomik Değerler (Atoms) ===\n")
# Atomik değerler, Elixir'de sabit ve benzersiz değerlerdir.
# Genellikle sembolik isimler olarak kullanılırlar.

state = :ok
IO.puts("Durum: #{state}\n")

action_status = :success
IO.puts("Eylem Durumu: #{action_status}\n")

error_status = :faied
IO.puts("Hata Durumu: #{error_status}\n")

response = :ok
error = :error

IO.puts("Cevap: #{response}, Hata: #{error}\n")

IO.puts("=== Listeler (Lists) ===\n")
# Listeler, Elixir'de sıralı veri yapılarıdır.
# Listeler, dinamik boyutlu ve elemanları farklı türlerde olabilir.

numbers = [1, 2, 3, 4, 5]
IO.puts("Liste: #{inspect(numbers)}\n")

names = ["Ahmet", "Mehmet", "Ayşe"]
IO.puts("İsimler: #{inspect(names)}\n")

firstList = [1, 2, 3]
secondList = [4, 5, 6]

combinedList = firstList ++ secondList
IO.puts("Birleştirilmiş Liste: #{inspect(combinedList)}\n")


IO.puts("=== Tuple'lar (Tuples) ===\n")
# Tuple'lar, sabit boyutlu veri yapılarıdır.
# Tuple'lar, elemanları farklı türlerde olabilir ve genellikle sabit veri gruplarını temsil eder.

# Tuple'lar, parantez içinde tanımlanır ve virgülle ayrılır.
person = {:ok, "Ahmet", 30}
IO.puts("Tuple: #{inspect(person)}\n")

coordinates = {10, 20}
IO.puts("Koordinatlar: #{inspect(coordinates)}\n")

IO.puts("=== Pattern Matching ===\n")
person_info = {"Ahmet", 30, "Software Engineer", ["Elixir", "Phoenix", "JavaScript", "Python", "Ruby", "Java"]}
IO.puts("Pattern Matching ile Bilgiler:\n")
# Pattern matching, Elixir'de veri yapılarının elemanlarını eşleştirmek için kullanılır.
{name, age, profession, skills} = person_info
IO.puts("İsim: #{name}")
IO.puts("Yaş: #{age}")
IO.puts("Meslek: #{profession}")
IO.puts("Yetenekler: #{inspect(skills)}")

api_response = {:ok, "Data retrieved successfully", {
  :user_info, name, age, profession, skills
}}

IO.puts("\nAPI Cevabı:\n")
# Pattern matching ile API cevabını ayrıştırma
{:ok, message, {:user_info, user_name, user_age, user_profession, user_skills}} = api_response
IO.puts("Durum: #{message}")
IO.puts("Kullanıcı Adı: #{user_name}")
IO.puts("Kullanıcı Yaşı: #{user_age}")
IO.puts("Kullanıcı Mesleği: #{user_profession}")
IO.puts("Kullanıcı Yetenekleri: #{inspect(user_skills)}")

listForPatternMatching = [1, 2, 3, 4, 5]
IO.puts("\nPattern Matching ile Liste Elemanları:\n")
# Pattern matching ile liste elemanlarını ayrıştırma
[first, second | rest] = listForPatternMatching
IO.puts("Birinci Eleman: #{first}")
IO.puts("İkinci Eleman: #{second}")
IO.puts("Kalan Elemanlar: #{inspect(rest)}")
