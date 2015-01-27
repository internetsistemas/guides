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
