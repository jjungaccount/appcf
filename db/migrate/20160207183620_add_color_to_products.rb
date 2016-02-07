class AddColorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :color, :string
    add_column :products, :product_year, :integer
    add_column :products, :sold_date, :date
  end
end
