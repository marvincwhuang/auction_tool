class CreateTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :templates do |t|
      t.string :column_one
      t.text :column_a_items, array: true, default: []
      t.text :column_b_items, array: true, default: []
      t.text :column_c_items_1, array: true, default: []
      t.text :column_c_items_2, array: true, default: []
      t.text :column_d_items_1, array: true, default: []
      t.text :column_d_items_2, array: true, default: []
      t.text :column_e_items, array: true, default: []
      t.text :column_f_items, array: true, default: []
      t.text :column_g_items, array: true, default: []
      t.text :column_h_items, array: true, default: []
      t.text :column_i_items, array: true, default: []
      t.text :column_j_items, array: true, default: []
      t.references :product, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
