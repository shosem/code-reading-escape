class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string  :title
      t.string  :slug
      t.boolean :published, default: true

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
