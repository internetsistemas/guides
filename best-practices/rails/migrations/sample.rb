# $ rails generate model Product name:string description:text
#
# 2015012619_create_products.rb
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
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

  def down
    change_column :products, :name, :string
  end
end
