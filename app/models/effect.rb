class Effect < ApplicationRecord
  include SoftDeletable

  has_many :card_effects
  has_many :cards, through: :card_effects

  after_soft_delete :soft_delete_card_effects!

  private

  def soft_delete_card_effects!
    card_effects.each(&:soft_delete!)
  end
end