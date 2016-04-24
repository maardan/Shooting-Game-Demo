class AddUserIdToGamerooms < ActiveRecord::Migration
  def change
    add_column :gamerooms, :user_id, :integer
  end
end
