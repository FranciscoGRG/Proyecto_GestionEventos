class Event < ApplicationRecord
  belongs_to :user
  belongs_to :user, default: -> { Current.user }
end
