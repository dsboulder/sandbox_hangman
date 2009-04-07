class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :round_id
      t.integer :algorithm_id
      t.string :guesses, :default => "", :null => false
      t.boolean :finished, :default => false, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
