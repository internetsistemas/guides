# RSpec Best Practices

## Rspec or Test::Unit?

* Both are great!
* [@tenderlove comparisson](http://tenderlovemaking.com/2015/01/23/my-experience-with-minitest-and-rspec.html)


## Our tips

* Don't prefix `it` block descriptions with should. Use Imperative mood instead.
* Use `subject` blocks to define objects for use in one-line specs.
* Use `.method` to describe class methods and `#method` to describe instance methods.
* Use `context` to describe testing preconditions.
* Use `describe '#method_name'` to group tests by method-under-test
* Use a single, top-level describe ClassName block.
* Order validation, association, and method tests in the same order that they appear in the class.
* Avoid the `private` keyword in specs.
* Prefer `eq` to `==` in RSpec.
* Separate `setup`, `exercise`, `verification`, and `teardown` test phases with new lines.
* Use RSpec's `expect` syntax.
* Use RSpec's allow syntax for method stubs.
* Use `not_to` instead of `to_not` in RSpec expectations.
* Avoid `any_instance` in rspec-mocks and mocha. Prefer dependency injection.
* Avoid `its`, `let!`, `specify`, and `before` in RSpec.
* Avoid using `subject` explicitly inside of an RSpec it block.
* Avoid using instance variables in tests.
* Disable real HTTP requests to external services with `WebMock.disable_net_connect!`.
* Don't test private methods.
* Test background jobs with a `Delayed::Job` matcher.
* Use stubs and spies (not mocks) in isolated tests.
* Use a single level of abstraction within scenarios.
* Use assertions about state for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.
* Use a Fake to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-SUT methods in expectations when possible.
* Prefer a plain object with only the required fields filled instead a `factory` when possible. (If your tests need only one field, you dont need to build a hole object.)
* Use `FactoryGirl` `build` instead of `create` when you don't need the `object` to be persisted. (`build` will not persiste the object, while `create` will.)
* Don't overuse `it` when dont needed, instead group your tests with same focus under one `it`. (Remember each `it` will call all scoped `let` and `before` blocks.)
* Avoid `!` on `let!` when you don't need it. (Lazy `let` will be invoked only when called, `let!` will be called before each example.) 
* Define objects inside the scope they will be used. Only define then in the begining if they will be used in ALL exemples. 
* If the tests are getting too complex, maybe the code need some refactor.