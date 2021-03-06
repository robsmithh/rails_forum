class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :email, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, uniqueness: { case_sensitive: false },
                     length: { maximum: 105 },
                     format: { with: VALID_EMAIL_REGEX }, if: -> { email.present? }

   validates :username, uniqueness: { case_sensitive: false }, presence: true

   validates :first_name, length: { maximum: 35 }, presence: true


   validates :last_name, length: { maximum: 35 }, presence: true


end
