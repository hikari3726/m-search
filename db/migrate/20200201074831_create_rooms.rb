class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :sender_id
      t.string :content

      t.timestamps
    end
  end
end
