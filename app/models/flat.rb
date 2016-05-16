class Flat < ActiveRecord::Base
  validates :address, presence: true, length: { maximum: 70 }
  validates :total_charges, presence: true
end

