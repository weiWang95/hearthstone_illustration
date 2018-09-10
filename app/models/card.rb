class Card < ApplicationRecord
  extend Enumerize
  include SoftDeletable
  include Convertible

  belongs_to :profession

  has_many :card_effects
  has_many :effects, through: :card_effects

  validates :consumption, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :attack, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :hp, numericality: { greater_than: 0 }, allow_blank: true

  enumerize :quality, in: %i{base normal rare epic legendary}, default: :normal

  mount_uploader :cover, CardCoverUploader
  mount_uploader :gold_cover, CardGoldCoverUploader

  before_save :convert_effect_content!
  after_soft_delete :soft_delete_card_effects!



  private

  def soft_delete_card_effects!
    card_effects.each(&:soft_delete!)
  end

  def convert_effect_content!
    return unless effect_content_changed?

    self.converted_effect_content = convert effect_content
  end
end
