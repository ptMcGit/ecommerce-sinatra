class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string      :description
      t.float       :price

      t.timestamps null: false
    end
  end
end
