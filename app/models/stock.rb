class Stock < ApplicationRecord
  validates :name, :qty, presence: true
end
