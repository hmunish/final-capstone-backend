class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :image
      t.text :description
      t.float :deposit
      t.float :finance_fee
      t.float :option_to_purchase_fee
      t.float :total_amount_payable
      t.integer :duration

      t.timestamps
    end
  end
end
