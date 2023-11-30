class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :stars
  has_many :reviews, through: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def received_bookings
    self.stars.map {|star| star.bookings }.flatten
  end
end
