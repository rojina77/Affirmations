class CreateEmotionAffirmations < ActiveRecord::Migration[7.1]
  def change
    create_table :emotion_affirmations do |t|
      t.references :emotion, null: false, foreign_key: true
      t.references :affirmation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
