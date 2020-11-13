class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :flats, dependent: :destroy
  validates :role, inclusion: { in:["owner", "customer"] }

  include PgSearch::Model
  multisearchable against: [:first_name, :last_name, :email, :role]
end
