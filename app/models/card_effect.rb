class CardEffect < ApplicationRecord
  include SoftDeletable

  belongs_to :card
  belongs_to :effect
end