# TODO

Writes the following sections:

* [Best Practices](/best-practices)
  * [General](/best-practices/README.md)
  * [RubyOnRails](/best-practices/rubyonrails/README.md)
    * [Controllers](/best-practices/rubyonrails/controllers/README.md)

    Minimal topics:
      * Naming
      * Be Rest as possible
      * Callbacks to define common things like set_*
      * Respond_with as default
      * Build method for nested controllers/collections in new/edit/create or update actions, i.e.: `@subcategory = @category.subcategories.build(subcategory_params)`
      * Delegates Flash messages to Responder
      * Use require params, i.e.: `params.require(:account_center).permit(:name, :kind, ...)`

    * [Models](/best-practices/rubyonrails/models/README.md)

    Minimal topics:

      * Associations
      * Validations with `validates`
      * Enums
      * Scopes
      * Dynamic attributes, i.e. extract firt name from a full name
      * Don't be fat. So, maintain only Associations, Validations, Scopes methods.

    * [Helpers](/best-practices/rubyonrails/helpers/README.md)
    * [Services](/best-practices/rubyonrails/services/README.md)

    Minimal topics:

      * Naming, special atention for methods
      * Class and object methods:

      ```ruby
      class StockService
        attr_accessor :product

        class << self
          def add_product(product, quantity: 1)
            new(product).add quantity
          end
        end

        def initialize(product)
          @product = product
        end

        def add(quantity)
          # ...
        end
      end
      ```

      * Use the Sandi Metz Rules (http://robots.thoughtbot.com/sandi-metz-rules-for-developers)
      * Single resposability
      * Dependency inversion

    * [Views](/best-practices/rubyonrails/views/README.md)

    Minimal topics:

      * Use slim or haml as render engines
      * Partials as possible
        * Use locals
      * Presenters
      * Create specificy variables, i.e.:

      ```ruby
      # Don't

      # Controller
      @categories = Categories.all

      # View
      @categories.active.each ...
      @categories.inactive.each ...


      # Do

      # Controller
      @active_categories = Categories.active
      @inactive_categories = Categories.active

      # View
      @active_categories.each ...
      @inactive_categories.each ...

      ```


    * [Routes](/best-practices/rubyonrails/routes/README.md)

    Minimal topics:

      * Use resources, don't raw methods (put, patch, get) or match
      * Nested resources and limits to nesting
      * Collections and Member routes
      * DRY and concerns

    * [Migrations](/best-practices/rubyonrails/migrations/README.md)

    Minimal topics:

      * Index use
      * FK use

  * [RSpec](/best-practices/rspec/README.md)
    * [RubyOnRails](/best-practices/rspec/rubyonrails/README.md)
* [Code Review](/code-review)
* [Protocol](/protocol)
  * [Git](/protocol/git)
