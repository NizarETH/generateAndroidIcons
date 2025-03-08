require 'open-uri'
require 'mini_magick'
require 'fileutils'

def generate_android_icons(image_url, output_dir = "android_icons")
  sizes = {
    "mipmap-mdpi" => 48,
    "mipmap-hdpi" => 72,
    "mipmap-xhdpi" => 96,
    "mipmap-xxhdpi" => 144,
    "mipmap-xxxhdpi" => 192
  }

  puts "Téléchargement de l'image..."
  image_path = "#{output_dir}/original.png"
  FileUtils.mkdir_p(output_dir) # Création du dossier de sortie

  begin
    URI.open(image_url) do |image|
      File.open(image_path, "wb") { |file| file.write(image.read) }
    end
  rescue StandardError => e
    puts "Erreur lors du téléchargement : #{e.message}"
    return
  end


  sizes.each do |folder, size|
    dir_path = "#{output_dir}/#{folder}"
    FileUtils.mkdir_p(dir_path) 
    output_path = "#{dir_path}/ic_launcher.png"

    puts "Génération de #{output_path} (#{size}x#{size})..."
    begin
      image = MiniMagick::Image.open(image_path)
      image.resize "#{size}x#{size}"
      image.write output_path
    rescue StandardError => e
      puts "Erreur lors de la génération de #{output_path} : #{e.message}"
    end
  end

  puts "Toutes les icônes ont été générées dans '#{output_dir}/mipmap-*'."
end

# Exemple d'utilisation :
 url = "https://i.imgur.com/R5LzkzF.jpeg"
 generate_android_icons(url)
