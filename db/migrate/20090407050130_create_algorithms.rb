class CreateAlgorithms < ActiveRecord::Migration
  def self.up
    create_table :algorithms do |t|
      t.string :name
      t.text :code
      t.integer :games, :default => 0, :null => false
      t.integer :score, :default => 0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :algorithms
  end
end
