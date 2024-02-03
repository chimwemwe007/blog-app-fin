class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :comments, :posts, on_delete: :cascade
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :likes, :posts, on_delete: :cascade
    add_foreign_key :likes, :users, on_delete: :cascade
    add_foreign_key :posts, :users, column: :author_id, on_delete: :cascade
  end
end
