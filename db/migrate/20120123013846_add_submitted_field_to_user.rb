class AddSubmittedFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :submitted, :boolean
    add_column :users, :score, :integer
  end
end
