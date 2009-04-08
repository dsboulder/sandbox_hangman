class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :round_id
      t.integer :algorithm_id
      t.integer :wrong_guesses, :default => 0, :null => false
      t.string :guesses, :default => "", :null => false
      t.boolean :finished, :default => false, :null => false
      t.boolean :disqualified, :default => false, :null => false
      t.string :last_error
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
