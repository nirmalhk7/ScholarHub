class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :institute
  belongs_to :degree
  belongs_to :branch

  serialize :interests, Array
  serialize :phone_numbers, Array
end
