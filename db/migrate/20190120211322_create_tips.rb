class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.string :title
      t.text :description
      t.integer :rating 
      t.string :link 
      t.belongs_to :lesson 
      t.belongs_to :user 
      t.timestamps
    end
    add_index :tips, [:user_id, :created_at] #allows for tips to be more easily retrieved by user and in order of creation
  end
end
