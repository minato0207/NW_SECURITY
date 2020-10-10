class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer    :user_id         , null: false, foreign_key: true
      t.text       :text            , null: false
      t.text       :title           , null: false
      t.integer    :security_id     , null: false
      t.timestamps
    end
  end
end
