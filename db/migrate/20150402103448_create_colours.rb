class CreateColours < ActiveRecord::Migration
  def change
    create_table :colours do |t|
      t.string :colour

      t.timestamps null: false
    end
  end
end
