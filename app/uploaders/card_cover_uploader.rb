class CardCoverUploader < ImageUploader
  def extension_whitelist
    %w(jpg jpeg)
  end
end