class User < ActiveRecord::Base
  has_many :organizations
  has_many :memberships, dependent: :destroy
  has_many :organizations_joined, through: :memberships, source: :organization

  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, :format => { :with => email_regex }, on: :create
  validates :password, presence: true, confirmation: true, on: [:create]
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }, allow_nil: true, on: [:update]
end
