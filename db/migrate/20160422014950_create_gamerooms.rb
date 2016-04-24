class CreateGamerooms < ActiveRecord::Migration
  def change
    create_table :gamerooms do |t|

      t.timestamps null: false
    end
  end
end
