# Fonksiyonlar (Functions)
# Fonksiyonlar, belirli bir görevi yerine getiren kod bloklarıdır.
# Fonksiyonlar, kodunuzu daha düzenli ve tekrar kullanılabilir hale getirir.
# Fonksiyon tanımlamak için `def` anahtar kelimesini kullanırız.
# Fonksiyonlar, belirli bir isimle tanımlanır ve çağrıldıklarında bu isimle anılırlar.

IO.puts("=== Fonksiyonlar (Functions) ===\n")

# Anonim fonksiyonlar (Anonymous Functions)
# Anonim fonksiyonlar, isimsiz olarak tanımlanan ve genellikle bir değişkene atanan fonksiyonlardır.
# Anonim fonksiyonlar, `fn` anahtar kelimesi ile başlar ve `->` ile biter.

toplama = fn a, b -> a + b end

# 'fn' fonksiyon başlatır, '->' ise fonksiyonun gövdesini belirtir.
# a ve b ise fonksiyona geçirilen parametrelerdir.
# '->' şunu döndür anlamına gelir.
# a + b ise fonksiyonun gövdesidir ve yapılacak işlemi belirtir.
# 'end' ise fonksiyonun bittiğini belirtir.

IO.puts("Toplama Fonksiyonu: #{toplama.(5, 3)}") # 8

# Elixir söz dizimine göre fonksiyonlar, parantez içinde çağrılır
# ve nokta (.) ile ayrılır. Yani `toplama.(5, 3)` ifadesi, `toplama` fonksiyonunu 5 ve 3 argümanlarıyla çağırır.

kare_al = fn x -> x * x end
IO.puts("Kare Alma Fonksiyonu: #{kare_al.(4)}") # 16

selam_ver = fn isim -> "Merhaba, #{isim}!" end
IO.puts("Selam Verme Fonksiyonu: #{selam_ver.("Ahmet")}") # "Merhaba, Ahmet!"

buyuk_harfe_cevir = fn kelime -> String.upcase(kelime) end
IO.puts("Büyük Harfe Çevirme Fonksiyonu: #{buyuk_harfe_cevir.("elixir")}") # "ELIXIR"

IO.puts("=== Pattern Matching ile Anonim Fonksiyonlar ===\n")
koordinat_mesafe = fn {x, y} -> :math.sqrt(x * x + y * y) end
IO.puts("Koordinat Mesafesi: #{koordinat_mesafe.({3, 4})}") # 5.0

# Liste alan fonksiyonlar
liste = fn [head | tail] ->
  IO.puts("Baş: #{head}")
  IO.puts("Kuyruk: #{inspect(tail)}")
end

IO.puts("Liste Fonksiyonu: #{liste.([1, 2, 3])}") # "Baş: 1\nKuyruk: [2, 3]"

IO.puts("=== Modüller (Modules) ===\n")

# Modüller, Elixir'de kodunuzu düzenlemek ve gruplamak için kullanılır.
# Benzer amaca hizmet eden fonksiyonları bir araya getirir.
# Modül tanımlamak için `defmodule` anahtar kelimesini kullanırız

defmodule Matematik do
  # Modül içinde fonksiyon tanımlamak için `def` anahtar kelimesini kullanırız.
  def topla(a, b) do
    a + b
  end

  def carp(a, b) do
    a * b
  end

  def kare(x) do
    x * x
  end
end

toplam = Matematik.topla(5, 3)
IO.puts("Matematik Modülü Toplama: #{toplam}") # 8
carpma = Matematik.carp(4, 2)
IO.puts("Matematik Modülü Çarpma: #{carpma}") # 8
kare = Matematik.kare(5)
IO.puts("Matematik Modülü Kare: #{kare}") # 25

# def ve defp farkı
# `def` anahtar kelimesi, modülün dışından erişilebilen fonksiyonlar tanımlar.
# `defp` anahtar kelimesi ise, modülün içinden erişilebilen, ancak modülün dışından erişilemeyen özel fonksiyonlar tanımlar.

IO.puts("=== Elixir'de Return ===\n")

# Elixir'de fonksiyonlar, son ifadeyi otomatik olarak döndürür.
# Yani, fonksiyonun sonundaki ifade, fonksiyonun dönüş değeridir.

defmodule DonusOrnekleri do
  def basit_donus do
    42
  end

  def kosullu_donus(x) do
    if x > 0 do
      "Pozitif"
    else
      "Negatif veya Sıfır"
    end
  end

  def coklu_islem(x, y) do
    toplam = x + y
    carpim = x * y
    _sonuc = toplam + carpim
  end

end

IO.puts("Basit Dönüş: #{DonusOrnekleri.basit_donus()}") # 42
IO.puts("Koşullu Dönüş: #{DonusOrnekleri.kosullu_donus(5)}") # "Pozitif"
IO.puts("Çoklu İşlem Dönüş: #{DonusOrnekleri.coklu_islem(3, 4)}") # 19

IO.puts("=== Tuple Return Pattern ===\n")

defmodule ApiSimulasyon do
  # API gibi success/error durumlarını simüle eden bir modül

  def basarili_api_cagri do
    {:ok, "İşlem başarılı!"}
  end

  def hatali_api_cagri do
    {:error, "Bir hata oluştu!"}
  end

  def kullanici_bilgisi(id) do
    if id > 0 do
      {:ok, %{id: id, isim: "Ahmet", yas: 30}}
    else
      {:error, "Geçersiz kullanıcı ID'si!"}
    end
  end
end

{status, result} = ApiSimulasyon.basarili_api_cagri()
IO.puts("API Çağrısı Durumu: #{status}, Sonuç: #{result}") # "API Çağrısı Durumu: :ok, Sonuç: İşlem başarılı!"

{durum, veri} = ApiSimulasyon.kullanici_bilgisi(1)
IO.puts("Kullanıcı Bilgisi Durumu: #{durum}, Veri: #{inspect(veri)}") # "Kullanıcı Bilgisi Durumu: :ok, Veri: %{id: 1, isim: "Ahmet", yas: 30}"
{durum, hata} = ApiSimulasyon.kullanici_bilgisi(-1)
IO.puts("Kullanıcı Bilgisi Durumu: #{durum}, Hata: #{hata}") # "Kullanıcı Bilgisi Durumu: :error, Hata: Geçersiz kullanıcı ID'si!"

IO.puts("=== Pipe Operator (|>) ===\n")

# Pipe operatörü, bir değeri bir fonksiyona geçirirken daha okunabilir bir kod yazmamızı sağlar.
# Pipe operatörü, `|>` sembolü ile gösterilir ve soldaki değeri sağdaki fonksiyona geçirir.

# Normal yazım
sonuc = String.upcase(String.reverse("elixir"))
IO.puts("Normal Yazım: #{sonuc}") # "RIXILE"

# Pipe operatörü ile yazım
sonuc = "elixir"
|> String.reverse() # rixile
|> String.upcase() # RIXILE

IO.puts("Pipe Operatörü ile Yazım: #{sonuc}") # "RIXILE"

# Neden Pipe Operatörü Kullanılır?
# 1. Okunabilirlik: Kod daha okunabilir hale gelir.
# 2. Zincirleme İşlemler: Birden fazla işlemi zincirleme olarak yapabiliriz.
# 3. Fonksiyonel Programlama: Fonksiyonel programlamada yaygın bir yaklaşımdır.
# 4. Daha Az Parantez: Parantez kullanımını azaltır, bu da kodu daha temiz hale getirir.

# Okunması Zor
_final = Enum.filter(Enum.map([1, 2, 3, 4, 5], fn x -> x * 2 end), fn x -> x > 5 end)

# Okunması Kolay
final = [1, 2, 3, 4, 5]
|> Enum.map(fn x -> x * 2 end) # [2, 4, 6, 8, 10]
|> Enum.filter(fn x -> x > 5 end) # [6, 8, 10]

IO.puts("Pipe Operatörü ile Okunabilirlik: #{inspect(final)}") # [6, 8, 10]

defmodule StringIslemler do
  def temizle_ve_buyut(metin) do
    metin
    |> String.trim() # Başındaki ve sonundaki boşlukları temizler
    |> String.downcase() # Küçük harfe çevirir
    |> String.upcase() # Büyük harfe çevirir
    |> String.replace(" ", "_") # Boşlukları alt çizgi ile değiştirir
  end
end

sonuc = StringIslemler.temizle_ve_buyut("    MerHaBA DüNya!     ")
IO.puts("Temizlenmiş ve Büyük Harfe Çevrilmiş Metin: #{sonuc}")


defmodule SayiIslemler do
  def iki_katina_cikar(sayi) do
    sayi * 2
  end

  def bes_ekle(sayi) do
    sayi + 5
  end

  def kare_al(sayi) do
    sayi * sayi
  end
end

final_sonuc = 3
|> SayiIslemler.iki_katina_cikar() # 6
|> SayiIslemler.bes_ekle() # 11
|> SayiIslemler.kare_al() # 121

IO.puts("Final Sonuç: #{final_sonuc}")


IO.puts(" === Function Guards ===\n")

# Guard = function'a girişte kontrol
# when kelimesi ile yazılır
# Amaç, belirli koşullara göre farklı işlemler yapmaktır.

defmodule GuardExample do

  def pozitif_kare(sayi) when sayi > 0 do
    sayi * sayi
  end

  def string_uzunluk(metin) when is_binary(metin) do
    String.length(metin)
  end

  def liste_uzunluk(liste) when is_list(liste) do
    length(liste)
  end

end


IO.puts("Pozitif Kare: #{GuardExample.pozitif_kare(5)}") # 25
IO.puts("String Uzunluk: #{GuardExample.string_uzunluk("Elixir")}") # 6
IO.puts("Liste Uzunluk: #{GuardExample.liste_uzunluk([1, 2, 3])}") # 3

IO.puts("Negatif Kare: #{GuardExample.pozitif_kare(-5)}") # nil
