class Topping < ApplicationRecord
  has_many :pizza_toppings, dependent: :destroy
  has_many :pizzas, through: :pizza_toppings
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.to_s.strip.titleize
  end
end
