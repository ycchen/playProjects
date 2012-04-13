class AddProductsLockVersion < ActiveRecord::Migration
  def up
  	add_column :products, :lock_version, :integer, :default => 0, :null => false
  end

  def down
  	drop_column :products, :lock_version
  end
end
