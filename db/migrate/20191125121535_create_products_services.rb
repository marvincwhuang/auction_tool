class CreateProductsServices < ActiveRecord::Migration[6.0]
  def change
    create_table :products_services do |t|
      t.references :product, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
