class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :stocks
  has_one_attached :main_image

  def admin?
    self.has_role? :admin
  end
  def moderator?
    self.has_role? :moderator
  end
  def anonymous?
    self.has_role? :anonymous
  end
end
