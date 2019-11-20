class CreateTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :templates do |t|
      t.string :template_name
      t.string :editor_data
      t.text :product_descriptions, array: true, default: []
      t.text :available_specs, array: true, default: []
      t.text :information_titles, array: true, default: []
      t.text :information_contents, array: true, default: []
      t.text :buy_more_items, array: true, default: []
      t.text :buy_more_item_urls, array: true, default: []
      t.text :warning, array: true, default: []
      t.text :gaurantee, array: true, default: []
      t.text :gaurantee_scope, array: true, default: []
      t.text :notice_for_use, array: true, default: []
      t.text :product_declaration, array: true, default: []
      t.text :image_urls, array: true, default: []

      t.timestamps
    end
  end
end
