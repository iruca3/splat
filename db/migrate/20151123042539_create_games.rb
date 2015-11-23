class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board
      t.text :turn
      t.integer :turn_number, null: false, default: 0

      t.timestamps null: false
    end
  end
end
