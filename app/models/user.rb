class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true
  has_many :pets
  has_many :places
  has_many :activities, dependent: :destroy
  has_many :trips
  has_many :appointments, through: :trips
end
