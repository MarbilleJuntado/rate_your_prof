class AddCourseIdProfessorIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :course_id, :integer
    add_column :reviews, :professor_id, :integer
  end
end
