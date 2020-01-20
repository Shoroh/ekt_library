class Book < ApplicationRecord

  validates :title,
            :author,
            :description,
            :status, presence: true

  has_and_belongs_to_many :categories
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :users, through: :posts
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def calculate_rating
    arr = []
    ratings.each { |i| arr << i.value }
    arr.empty? ? 0 : arr.reduce(:+) / arr.size.to_i
  end

  def available?
    posts.where(active: true).nil?
  end

  def active_user
    active_post&.user
  end

  def active_post
    posts&.where(active: true).first
  end

  def close_active_post
    active_post&.update!(active: false, end_date: Time.now)
  end
end
