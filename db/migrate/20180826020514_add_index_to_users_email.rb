class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    # emailの主キー化
    add_index :users, :email, unique: true
  end
end
