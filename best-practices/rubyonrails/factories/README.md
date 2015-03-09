# Ruby on Rails Factories (FactoryGirl)

### Common things and structure

* Don't use direct association in FactoryGirl.
* Prefer create structure of database on test to make the visualization more clear.
* Declare `belongs_to` associations at the end of factory and with the most simpliest form:
  
  ```ruby
  factory :qualified_product do
    name { Forgery('lorem_ipsum').words 3 }
    
    supplier
    product
  end
  
  # When the attribute does not match the model name, you'll have to declare like this:
  
  factory :quotation_group do
    association :current_executor, factory: collaborator
  end
  ```
* Just declare `has_many` with it really needed to test, using `trait`.

### Coding Style and Conventions

* Declare the migrations grouped by data type and ordered alphabetically. Forgeries of the same kind will be grouped in most cases increasing the readability.
* Attributes come first, then associations and enums at last; as in the migrations. Break line only between these kind of "blocks".
 
### `Forgery` coding style and conventions

 * Use `Forgery('basic').text` for string attributes that does not match any of the out-of-box forgeries. Some examples: `bank_account`, `passport_number`, `cpf`, ... Custom forgeries should be created for these kind of attributes, but it's not a priority at this stage of the project in my opinion.
  * Use `Forgery('date').date` for datetime attributes. There is an issue when using this and testing in controllers; I will attend to this matter in a different GitHub issue.
  * Use `Forgery('monetary').money` for decimal attributes.
  * Use `Forgery('basic').number` for integer attributes.
  * Use `Forgery('lorem_ipsum').text` for text attributes.
  * I suggest using `sequence` for unique attributes.
  * For enum attributes, use `MyEnum.list.sample`.

__Warning! FactoryGirl is a highway to hell if not follow this three simple rules!__
