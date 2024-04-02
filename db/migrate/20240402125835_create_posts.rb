class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :img_url, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
