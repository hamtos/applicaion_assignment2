class Book < ApplicationRecord
  belongs_to :user
  has_many :favorite, dependent: :destroy
  has_many :book_comment, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorite.exists?(user_id: user.id)
  end

  def self.looks(searches, words)
    case searches
    when "perfect_match" then
      @books = Book.where("title LIKE ?", "#{words}")
    when "forward_match" then
      @books = Book.where("title LIKE ?", "#{words}%")
    when "backward_match" then
      @books = Book.where("title LIKE ?", "%#{words}")
    when "partial_match" then
      @books = Book.where("title LIKE ?", "%#{words}%")
    else
    end
  end
end
