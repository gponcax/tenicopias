class Semester < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :group

end
