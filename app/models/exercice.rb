class Exercice < ApplicationRecord
  has_many :submissions
  has_many :tests
end
