class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :device_model
      t.string :device_IMEI
      t.float :year_price
      t.integer :number_plots
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
