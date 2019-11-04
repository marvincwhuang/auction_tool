class CreateYahooTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :yahoo_templates do |t|
      t.string :highlight
      t.string :product_description_title
      t.text :product_description
      t.string :available_spec_title
      t.text :available_spec
      t.text :marketplace_detail
      t.text :warning
      t.text :gaurantee
      t.text :gaurantee_scope
      t.text :notice_for_use
      t.text :product_declaration
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :buy_more_product_1
      t.string :buy_more_product_url_1
      t.string :buy_more_product_2 
      t.string :buy_more_product_url_2
      t.string :buy_more_product_3
      t.string :buy_more_product_url_3
      t.string :buy_more_product_4
      t.string :buy_more_product_url_4
      t.references :product, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
