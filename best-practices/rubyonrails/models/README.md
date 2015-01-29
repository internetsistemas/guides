## Ruby on Rails Models

###### Validations

* Prefeer use of hash validations, like `validates :name, presence: true`, for presence, inclusion, etc.

* When use custom validation, create a class in `app/validations` with custom validation and call `validates_with` in model. [Example](http://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates_with)

* Validate object under the foreign_key

###### Scopes, class methods and object methods

* Prefer class methods under scopes

* When query is create a query class into `app/queries`

* Keep simple methods in model, like update an attribute (without condition) and simple queries.

###### Specs

* Define `subject` as object of class

* Test associations, validations and attributes

* Test class methods in `describe '.method'`

* Test instance method in `describe '.method'`
