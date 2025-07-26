class Topping < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.to_s.strip.titleize
  end
end
