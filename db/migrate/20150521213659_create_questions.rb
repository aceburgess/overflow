class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   :title, null: false
      t.text     :content, null: false
      t.integer  :user_id, null: false
      t.boolean  :is_answered, null: false, default: false
      t.integer  :chosen_answer_id

      t.timestamps null: false
    end
  end
end
