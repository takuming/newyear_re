class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :lbreflections, dependent: :destroy
  has_many :lbcuriosities , dependent: :destroy
  has_many :lbmonths, dependent: :destroy
  has_many :efforts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
