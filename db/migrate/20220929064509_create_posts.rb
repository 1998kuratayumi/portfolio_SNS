class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :user_id
      t.string :address
      t.float :latitude
      t.float :longitu
      t.timestamps
    end
  end
end
