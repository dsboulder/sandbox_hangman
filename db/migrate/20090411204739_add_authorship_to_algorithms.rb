class AddAuthorshipToAlgorithms < ActiveRecord::Migration
  def self.up
    add_column :algorithms, :author, :string
    add_column :algorithms, :password, :string
  end

  def self.down
    remove_column :algorithms, :password
    remove_column :algorithms, :author
  end
end
