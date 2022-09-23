# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :commerces, dependent: :destroy
  has_many :products, dependent: :destroy

  # VALIDATIONS
  validates :name, :birthdate, presence: true
  # Validate phone number
  validates :phone, length: { is: 10 }
  # Validate age for sellers
  validate :validate_sellers_age 
  
  enum role: { buyer: 0, seller: 1, admin: 2 }

  private

  def validate_sellers_age 
    years = ((Time.now - birthdate.to_time) / 1.years.second).to_int
    if years < 18 && role == "seller"
      errors.add(:birthdate, " Necesitas ser mayor de edad para registrarte como vendedor") 
    end
  end
end
