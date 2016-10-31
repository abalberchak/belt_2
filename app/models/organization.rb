class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  validates :name, presence: true, length: { minimum: 5 }, on: :create
  validates :description, presence: true, length: { minimum: 10 }, on: :create
end
