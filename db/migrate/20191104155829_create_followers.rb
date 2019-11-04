class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :followed_by_id, null: false

      t.timestamps
    end

    add_index :followers, [:user_id, :followed_by_id], unique: true
  end
end
