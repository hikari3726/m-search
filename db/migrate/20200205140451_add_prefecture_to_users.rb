class AddPrefectureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prefecture, :integer, null: false, default: 0
  end
end
