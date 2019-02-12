class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    #this enforces uniqueness at the db level in case a single user makes two requests in quick succession.  
    add_index :users, :email, unique: true  #the add_index by itself does not enforce uniqueness but the set options do.  In addition, linking an index to email improves efficiency by not having the whole table be scanned.
  end
end
