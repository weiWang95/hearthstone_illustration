class MagicCard < Card
  validates :attack, :hp, absence: false
end