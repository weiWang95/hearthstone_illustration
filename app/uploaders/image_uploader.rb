class ImageUploader < ApplicationUploader
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
