class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :entry_id
      t.string :comment_content

      t.timestamps
    end
    add_index :comments , [:user_id,:entry_id,:created_at] , unique: true
  end
end
