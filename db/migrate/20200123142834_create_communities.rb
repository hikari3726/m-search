class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.integer :user_id
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
