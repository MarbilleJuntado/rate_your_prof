class Review < ApplicationRecord
  belongs_to :course
  belongs_to :professor
end
