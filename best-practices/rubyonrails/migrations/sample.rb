# $ rails generate model Product recommended_price:decimal code:string name:string description:text kind:integer
#
# 2015012619_create_products.rb
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :recommended_price, precision: 10, scale: 2
      t.string :code
      t.string :name
      t.text :description
      t.integer :kind, index: true
      
      t.timestamps null: false
    end
  end
end

# $ rails generate migration ChangeNameTypeInProducts
#
# 2015012619_change_name_tyoe_in_products.rb
class ChangeNameTypeInProducts < ActiveRecord::Migration
  def up
    change_column :products, :name, :text
  end
end
