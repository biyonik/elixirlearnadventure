# İleri Seviye Pattern Matching

IO.puts("=== İleri Seviye Pattern Matching ===\n")
IO.puts("=== Liste Yapılarını Parçalama ===\n")

defmodule ListePattern do

  # İlk iki elemanı al
  def ilk_iki_eleman([]) do
    {:error, "Boş Liste"}
  end

  def ilk_iki_eleman([tek]) do
    {:error, "Sadece bir eleman var: #{tek}"}
  end

  def ilk_iki_eleman([birinci, ikinci | _geri_kalan]) do
    {:ok, {birinci, ikinci}}
  end

  # Son eleman
  def son_eleman([]) do
    {:error, "Boş liste"}
  end

  def son_eleman([tek_eleman]) do
    {:ok, tek_eleman}
  end

  def son_eleman([_head | tail]) do
    son_eleman(tail)
  end

  # Listeyi ortadan böl
  def ortadan_bol(liste) do
    uzunluk = length(liste)
    orta = div(uzunluk, 2)

    {ilk_yarim, ikinci_yarim} = Enum.split(liste, orta)

    %{
      ilk_yarim: ilk_yarim,
      ikinci_yarim: ikinci_yarim,
      toplam_uzunluk: uzunluk
    }
  end
end

liste = [1, 2, 3, 4, 5, 6]

{status, result} = ListePattern.ilk_iki_eleman(liste)
IO.puts("İlk iki: #{status} - #{inspect(result)}")

{status, son} = ListePattern.son_eleman(liste)
IO.puts("Son eleman: #{status} - #{son}")

bolum = ListePattern.ortadan_bol(liste)
IO.inspect(bolum, label: "Ortadan bölünmüş")

IO.puts("=== Nested Pattern Matching ===\n")

user_data = %{
  user: %{
    name: "Ahmet ALTUN",
    age: 35,
    address: %{
      city: "Balıkesir",
      district: "Karesi",
      coordinates: {41.0082, 28.9784}
    }
  },
  preferences: %{
    theme: :dark,
    language: :turkish,
    notifications: true
  }
}


case user_data do
  %{
    user: %{
      name: name,
      address: %{
        city: city,
        coordinates: {lat, lng}
      }
    },
    preferences: %{theme: theme}
  } ->
    """
      Kullanıcı: #{name}
      Şehir: #{city}
      Koordinat: #{lat}, #{lng}
      Tema: #{theme}
    """
    _ -> "Geçersiz kullanıcı formatı"
end
|> IO.puts()

IO.puts("=== With Statements ===\n")

# with = 'eğer herşey yolunda giderse'
# Birden fazla işlemi sıralı yapar
# Herhangi biri başarısız olursa durur

defmodule KullaniciIslem do
  def kullanici_olustur(params) do
    with {:ok, name} <- isim_dogrula(params["name"]),
         {:ok, email} <- email_dogrula(params["email"]),
         {:ok, age} <- yas_dogrula(params["age"]) do
      # Hepsi başarılı olduysa
      {:ok, %{name: name, email: email, age: age}}
    else
      # Herhangi biri başarısız olduysa
      {:error, reason} -> {:error, reason}
      _ -> {:error, "Bilinmeyen hata"}
    end
  end

  defp isim_dogrula(name) when is_binary(name) and byte_size(name) > 2 do
    {:ok, String.trim(name)}
  end

  defp isim_dogrula(_) do
    {:error, "Geçersiz isim!"}
  end

  defp email_dogrula(email) when is_binary(email) do
    if String.contains?(email, "@") do
      {:ok, String.downcase(email)}
    else
      {:error, "Geçersiz email"}
    end
  end
  defp email_dogrula(_), do: {:error, "Email string olmalı"}

  defp yas_dogrula(age) when is_integer(age) and age > 0 and age < 120 do
    {:ok, age}
  end
  defp yas_dogrula(_), do: {:error, "Geçersiz yaş"}
end

# Test - başarılı durum
params = %{"name" => "Ali Yılmaz", "email" => "ali@test.com", "age" => 25}
result = KullaniciIslem.kullanici_olustur(params)
IO.inspect(result, label: "Başarılı kullanıcı")

# Test - başarısız durum
params_hata = %{"name" => "A", "email" => "invalid", "age" => 200}
result_hata = KullaniciIslem.kullanici_olustur(params_hata)
IO.inspect(result_hata, label: "Hatalı kullanıcı")
