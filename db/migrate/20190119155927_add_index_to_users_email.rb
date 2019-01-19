class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    #this enforces uniqueness at the db level in case a single user makes two requests in quick succession.  
    add_index :users, :email, unique: true
  end
end
