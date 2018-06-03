class Course < ApplicationRecord
  has_and_belongs_to_many :professors, inverse_of: :professor
  belongs_to :user
end
