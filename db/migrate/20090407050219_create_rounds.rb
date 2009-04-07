class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.string :word, :null => false, :default => ""
      t.integer :iterations, :default => 0
      t.boolean :finished, :default => false, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
