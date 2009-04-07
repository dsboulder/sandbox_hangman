class CreateAlgorithms < ActiveRecord::Migration
  def self.up
    create_table :algorithms do |t|
      t.string :name
      t.text :code
      t.integer :games
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :algorithms
  end
end
