class CardGoldCoverUploader < ImageUploader
  def extension_whitelist
    %w(gif)
  end
end