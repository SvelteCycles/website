class FixCategoryColumnName < ActiveRecord::Migration
  def self.up
    rename_column :categories, :name, :category
  end

  def self.down

  end
end
