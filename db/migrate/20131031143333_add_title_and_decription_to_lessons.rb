class AddTitleAndDecriptionToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :title, :string
  	add_column :lessons, :description, :string
  end
end
