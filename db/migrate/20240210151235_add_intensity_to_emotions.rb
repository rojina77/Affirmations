class AddIntensityToEmotions < ActiveRecord::Migration[7.1]
  def change
    add_column :emotions, :intensity, :integer
  end
end
