# Practice - 5
# Easy Level
# Shopping List
# Scenario: "File management system, you are categorizing file types by extension."
# Topics learned: "String pattern matching, String module functions, guards with calculations"

defmodule FileAnalysis do
  def file_type(filename) do
    filename_lower = String.downcase(filename)

    cond do
      # Resim dosyaları
      String.ends_with?(filename_lower, ".jpg") or
      String.ends_with?(filename_lower, ".jpeg") or
      String.ends_with?(filename_lower, ".png") or
      String.ends_with?(filename_lower, ".gif") ->
        {:image, "Image file"}

      # Video dosyaları
      String.ends_with?(filename_lower, ".mp4") or
      String.ends_with?(filename_lower, ".avi") or
      String.ends_with?(filename_lower, ".mkv") ->
        {:video, "Vide file"}

      # Döküman dosyaları
      String.ends_with?(filename_lower, ".pdf") or
      String.ends_with?(filename_lower, ".doc") or
      String.ends_with?(filename_lower, ".docx") ->
        {:document, "Document file"}

      # Kod dosyaları
      String.ends_with?(filename_lower, ".ex") or
      String.ends_with?(filename_lower, ".exs") or
      String.ends_with?(filename_lower, ".py") or
      String.ends_with?(filename_lower, ".js") ->
        {:code, "Code file"}

      true ->
        {:unknown, "Unknown file type"}
    end
  end

  def category_of_size(size) do
    case size do
      size when size < 1024 ->
        "Small size (#{size} bytes)"

      size when size < 1024 * 1024 ->
        kb = Float.round(size / 1024, 2)
        "Medium size. (#{kb} KB)"

      size when size < 1024 * 1024 * 1024 ->
        mb = Float.round(size / (1024 * 1024), 2)
        "Large size. (#{mb} MB)"

      size ->
        gb = Float.round(size / (1024 * 1024 * 1024), 2)
        "Very large size. (#{gb} GB)"
    end
  end

  def file_summary(filename, size) do
    {type_atom, type_description} = file_type(filename)
    size_desc = category_of_size(size)

    emoji = case type_atom do
      :image -> "🖼️"
      :video -> "🎥"
      :document -> "📄"
      :code -> "💻"
      :unknown -> "❓"
    end

    "#{emoji} #{filename} - #{type_description} - #{size_desc}"
  end
end

files = [
  {"vacation.jpg", 2_500_000},
  {"movie.mp4", 1_500_000_000},
  {"report.pdf", 350_000},
  {"app.ex", 12_000},
  {"photo.PNG", 800_000},
  {"script.py", 5_500},
  {"readme.txt", 1_200},
  {"archive.zip", 50_000_000}
]

IO.puts("=== File Analysis ===")
for {file, size} <- files do
  summary = FileAnalysis.file_summary(file, size)
  IO.puts(summary)
end
