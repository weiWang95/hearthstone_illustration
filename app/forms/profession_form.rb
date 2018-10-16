class ProfessionForm
  include ActiveModel::Model

  Error = Class.new(StandardError)

  attr_reader :profession
  attr_accessor :name, :icon, :skill

  validates :name, :icon, :skill, presence: true

  def initialize(profession, params = {})
    @profession = profession
    profession.assign_attributes(params)
    new_params = profession.as_json(only: attributes.keys)
    super(new_params)
  end

  def save
    return unless valid?
    save!
    errors.blank?
  end

  private

  def save!
    profession.save
  end

  def attributes
    {
      name: name,
      icon: icon,
      skill: skill
    }
  end
end
