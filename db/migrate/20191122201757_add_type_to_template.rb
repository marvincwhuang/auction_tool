class AddTypeToTemplate < ActiveRecord::Migration[6.0]
  def change
    add_column :templates, :category, :integer
  end
end
