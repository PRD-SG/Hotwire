class Stock < ApplicationRecord
  validates :name,  presence: true
  validates :qty, :numericality => {:greater_than => 0}
  has_one_attached :main_image
  belongs_to :user

end
