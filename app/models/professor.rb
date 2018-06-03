class Professor < ApplicationRecord
  has_and_belongs_to_many :courses, inverse_of: :course
  belongs_to :user
end
