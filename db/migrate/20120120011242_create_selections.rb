class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :song_id
      t.integer :user_id
      t.boolean :number1

      t.timestamps
    end
  end
end
