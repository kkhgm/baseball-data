class Game < ApplicationRecord
  belongs_to :team
  belongs_to :enemy
  belongs_to :doom
end
