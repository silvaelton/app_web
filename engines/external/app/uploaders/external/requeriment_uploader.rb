module External
  class RequerimentUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    storage :file
  
    version :thumb do
      process :resize_to_fit => [100, 100]
      process :quality => 100 
    end
    
    def store_dir
      "uploads/requeriment"
    end

    def extension_white_list
      %w(jpg jpeg gif png pdf docx doc)
    end

    def filename
      if original_filename
        @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "#{@name}.#{file.extension}"
      end
    end
    
  end 
end
