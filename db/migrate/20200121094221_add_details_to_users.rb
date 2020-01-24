class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :birthplace, :string
    add_column :users, :artist, :text
    add_column :users, :description, :text
  end
end
