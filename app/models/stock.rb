class Stock < ApplicationRecord
  #Stock
  validates :name,  presence: true
  validates :qty, :numericality => {:greater_than => 0}
  #Image
  has_one_attached :main_image
  #User
  belongs_to :user

end
