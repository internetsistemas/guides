# Ruby on Rails Models

## Coding Style and Conventions

* The following order is suggested: associations, validations, enumerations, scopes, class and object methods. Everything in alphabetical order.
* `has_many` associations come first, followed by `belongs_to` associations. Any other kind of association comes before `has_many`. Break line between kinds of associations, but not between associations of the same kind.
* Sentences like `accepts_nested_attributes_for` come after associations.
* Validate associations first and attributes last. Break line between associations and attributes validations, but not between validations of the same kind. Enumerations are validated on theirs declarations.
* Always use `datetime` for date attributes, even if in the MER it's defined as `DATE`.

## Validations

* Prefer use of hash validations, like `validates :name, presence: true`, for presence, inclusion, etc.
* Please, do not validate multiple attributes in the same line. Declare a `validates` sentence for each association or attribute.
* When use custom validation, create a class in `app/validations` with custom validation and call `validates_with` in model. [Example](http://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates_with)
* Validate object under the `foreign_key`.
* Never validate presence of boolean, nor it should be tested. Use `validates :boolean_attr, inclusion: [true, false]` instead.

## Scopes, class methods and object methods

* Prefer class methods under scopes
* When query is create a query class into `app/queries`
* Keep simple methods in model, like update an attribute (without condition) and simple queries.

## Specs

* Define `subject` as object of class
* Test associations, validations and attributes
* Test class methods in `describe '.method'`
* Test instance method in `describe '.method'`
* Use [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers).
