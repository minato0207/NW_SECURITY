class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text
      t.text :title
      t.datetime :date
      t.timestamps
    end
  end
end
