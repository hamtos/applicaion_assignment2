class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :book_comment, dependent: :destroy

  has_many :follower_relationship, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following_users, through: :follower_relationship, source: :followed

  has_many :followed_relationship, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower_users, through: :followed_relationship, source: :follower

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: {maximum: 50 }

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def following?(user)
    self.following_users.include?(user)
  end
end
