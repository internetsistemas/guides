## RSpec

###### Rspec and Test::Unit

* Both are great!

* [@tenderlove comparisson](http://tenderlovemaking.com/2015/01/23/my-experience-with-minitest-and-rspec.html)


###### Tips with rspec

* Don't prefix it block descriptions with should. Use Imperative mood instead.

* Use subject blocks to define objects for use in one-line specs.

* Use .method to describe class methods and #method to describe instance methods.

* Use context to describe testing preconditions.

* Use describe '#method_name' to group tests by method-under-test

* Use a single, top-level describe ClassName block.

* Order validation, association, and method tests in the same order that they appear in the class.

* Avoid the private keyword in specs.

* Prefer eq to == in RSpec.

* Separate setup, exercise, verification, and teardown phases with newlines.

* Use RSpec's expect syntax.

* Use RSpec's allow syntax for method stubs.

* Use not_to instead of to_not in RSpec expectations.

* Avoid any_instance in rspec-mocks and mocha. Prefer dependency injection.

* Avoid its, let, let!, specify, and before in RSpec.

* Avoid using subject explicitly inside of an RSpec it block.

* Avoid using instance variables in tests.

* Disable real HTTP requests to external services with WebMock.disable_net_connect!.

* Don't test private methods.

* Test background jobs with a Delayed::Job matcher.

* Use stubs and spies (not mocks) in isolated tests.

* Use a single level of abstraction within scenarios.

* Use an it example or test method for each execution path through the method.

* Use assertions about state for incoming messages.

* Use stubs and spies to assert you sent outgoing messages.

* Use a Fake to stub requests to external services.

* Use integration tests to execute the entire app.

* Use non-SUT methods in expectations when possible.
