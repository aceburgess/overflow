class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.boolean :is_upvote, null: false
      t.index [:user_id, :votable_id, :votable_type], unique: true

      t.timestamps null: false
    end
  end
end
