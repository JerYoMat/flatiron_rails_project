class AddContentToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :content, :string 
  end
end
