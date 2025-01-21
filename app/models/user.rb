class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relacion 1:N para los eventos organizados por el usuario
  has_many :events

  # Relacion N:M para los eventos a los que asiste el usuario
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
end
