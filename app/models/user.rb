class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  validates :name, presence: true
  validates :name, uniqueness: true, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}
  validates :email, presence: true

  has_many :books, dependent: :destroy

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def remember_me
    true
  end
end

