
IO.puts("Fonksiyonlar ve Modüller Örnekleri\n")

IO.puts("Anonim Fonksiyonlar")

toplama = fn a, b -> a + b end

IO.puts("Toplama Fonksiyonu: #{toplama.(5, 3)}") # 8

koordinat_string = fn {x, y} -> "Koordinat: (#{x}, #{y})" end
IO.puts("Koordinat String Fonksiyonu: #{koordinat_string.({3, 4})}") # "Koordinat: (3, 4)"

liste_topla = fn liste -> Enum.sum(liste) end
IO.puts("Liste Toplama Fonksiyonu: #{liste_topla.([1, 2, 3, 4, 5])}") # 15


IO.puts(" === Modüller ve İsimli Fonksiyonlar ===\n")

defmodule Hesaplayici do

  def toplama(a, b) do
    a + b
  end

  def cikarma(a, b) do
    a - b
  end

  def carpma(a, b) do
    a * b
  end

  def bolme(a, b) when b != 0 do
    a / b
  end

  def bolme(_a, 0) do
    {:error, "Bölme işlemi hatası: 0'a bölme yapılamaz."}
  end

  # Private belirteçli fonksiyon
  defp mutlak_deger(x) when x < 0 do
    -x
  end

  def fark(a, b) do
    sonuc = a - b
    mutlak_deger(sonuc)
  end
end


  # Module kullanımı
IO.puts("Toplama: #{Hesaplayici.toplama(10, 5)}")
IO.puts("Çıkarma: #{Hesaplayici.cikarma(10, 3)}")
IO.puts("Çarpma: #{Hesaplayici.carpma(4, 6)}")
IO.puts("Bölme: #{Hesaplayici.bolme(15, 3)}")

# Hata durumu
{durum, mesaj} = Hesaplayici.bolme(10, 0)
IO.puts("Sıfıra bölme: #{durum} - #{mesaj}")

# Private function kullanımı
IO.puts("Fark (mutlak): #{Hesaplayici.fark(5, 8)}")


IO.puts("=== Tuple(Demet) Pattern Matching ===\n")

defmodule UserService do

  def get_by_id(id) when is_integer(id) and id > 0 do
    {:ok, %{
      id: id,
      name: "Kullanici_#{id}",
      email: "kullanici_#{id}@ornek.com",
      active: true
    }}
  end

  def get_by_id(_id) do
    {:error, "Geçersiz 'id' parametre değeri!"}
  end

  def save(user_data) when is_map(user_data) do
    if Map.has_key?(user_data, :name) do
      {:ok, "Kullanıcı kaydetme başarılı!"}
    else
      {:error, "Kullanıcı kaydı başarısız! İsim alanı zorunludur"}
    end
  end
end

case UserService.get_by_id(1) do
  {:ok, user} ->
    IO.puts("Kullanıcı bulundu: #{user.name}")
    IO.puts("Email: #{user.email}")
  {:error, reason} ->
    IO.puts("Hata: #{reason}")
end

{status, message} = UserService.get_by_id(-1)
IO.puts("Status: #{status}, Message: #{message}")

IO.puts("\n--- GUARDS ---")

defmodule GuardluFonksiyonlar do
  # Sadece pozitif sayılar
  def faktoryel(n) when n > 0 and is_integer(n) do
    if n <= 1 do
      1
    else
      n * faktoryel(n - 1)
    end
  end

  def faktoryel(_n) do
    {:error, "Sadece pozitif tam sayılar kabul edilir"}
  end

  # Sadece string'ler
  def string_analiz(metin) when is_binary(metin) and byte_size(metin) > 0 do
    %{
      uzunluk: String.length(metin),
      kelime_sayisi: metin |> String.split(" ") |> length(),
      buyuk_harf: String.upcase(metin)
    }
  end

  def string_analiz(_metin) do
    {:error, "Geçerli bir string gerekli"}
  end
end

# Guard kullanımı
IO.puts("5! = #{GuardluFonksiyonlar.faktoryel(5)}")

{status, result} = GuardluFonksiyonlar.faktoryel(-1)
IO.puts("Negatif faktöriyel: #{status} - #{result}")

# String analizi
analiz = GuardluFonksiyonlar.string_analiz("Merhaba güzel dünya")
IO.inspect(analiz, label: "String analizi")
