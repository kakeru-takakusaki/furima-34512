class AddColumnItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sold_status, :string, default: 'sale', null: false
  end
end
