# Ruby on Rails Factories (FactoryGirl)

### Common things and structure

* Don't use direct association in FactoryGirl.
* Prefer create structure of database on test to make the visualization more clear.
* Declare `belongs_to` associations at the end of factory and the 'old school' way:
  
  ```ruby
  factory :qualified_product do
    name { Forgery(:lorem_ipsum).words 3 }
    
    association :supplier, factory: :supplier
    association :product, factory: :product
  end
  
  # When the attribute does not match the model name, you'll have to declare like this:
  
  factory :quotation_group do
    association :current_executor, factory: :collaborator
  end
  ```
* Just declare `has_many` with it really needed to test, using `trait`.

### Coding Style and Conventions

* Declare the migrations grouped by data type and ordered alphabetically. Forgeries of the same kind will be grouped in most cases increasing the readability.
* Attributes come first, then associations and enums at last; as in the migrations. Break line only between these kind of "blocks".
 
### `Forgery` coding style and conventions

 * Use `Forgery(:basic).text` for string attributes that does not match any of the out-of-box forgeries. Some examples: `bank_account`, `passport_number`, `cpf`, ... Custom forgeries should be created for these kind of attributes.
  * Use `Forgery(:date).date` for datetime attributes.
  * Use `Forgery(:monetary).money` for decimal attributes.
  * Use `Forgery(:basic).number` for integer attributes.
  * Use `Forgery(:lorem_ipsum).text` for text attributes.
  * Use `sequence` for unique attributes.
  * Use `MyEnum.list.sample` for enums.
  
##### Most exactly examples:
  * `Forgery(:name).first_name` for product's name attribute.
  * For a `background_color` attribute, use `Forgery(:basic).hex_color` instead of `Forgery(:basic).text`.

__Warning! FactoryGirl is a highway to hell if not follow this three simple rules!__
