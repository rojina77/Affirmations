class CreateAffirmations < ActiveRecord::Migration[7.1]
  def change
    create_table :affirmations do |t|
      t.text :content
      t.integer :emotion_id

      t.timestamps
    end
  end
end
