class ChangeReviewsAtSchools < ActiveRecord::Migration
  def change
  	change_column(:schools, :reviews, :integer, default: 0)
  end
end
