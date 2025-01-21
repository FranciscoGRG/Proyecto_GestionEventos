class Event < ApplicationRecord
  # Relacion 1:N con el organizador del evento
  belongs_to :user

  # Relacion N:M con los asistentes del evento
  has_many :attendances
  has_many :users, through: :attendances
end
