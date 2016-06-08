class CreatePurchasesTable < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string      :item_id
      t.string      :user_id
      t.string      :quantity

      t.timestamps null: false
    end
  end
end
