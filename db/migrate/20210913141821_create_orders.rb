class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.decimal :discount
      t.decimal :paid

      t.timestamps
    end
  end
end
