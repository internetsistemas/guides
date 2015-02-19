# Object-Oriented Design Best Practices


## General

* Avoid global variables.
* Avoid long parameter lists.
* Limit collaborators of an object (entities an object depends on).
* Limit an object's dependencies (entities that depend on an object).
* Prefer composition over inheritance.
* Prefer small methods. Between one and five lines is best.
* Prefer small classes with a single, well-defined responsibility. When a
  class exceeds 100 lines, it may be doing too many things.
* [Tell, don't ask](http://robots.thoughtbot.com/post/27572137956/tell-dont-ask).
* [Sandi Metz Rules](http://robots.thoughtbot.com/sandi-metz-rules-for-developers)


## SOLID Principles

* [Uncle Bob's article](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod)
* [Thoughtbot's article](http://robots.thoughtbot.com/back-to-basics-solid)
* [Groupbuddies' article](https://blog.groupbuddies.com/posts/19-solid-principles-in-ruby)


### Single Responsability (SRP)

* A Class must have just one reason to change your code.
* A Class must do just one thing.
* A Class must be part of just one domain problem.
* Classes that do not follow SRP tend to present:
  * Difficulty understanding, maintenance, extension and reuse.
  * The class can have multiple dependencies and suffer more changes.
  * Hinders new implementations.
  * Changes in the class can impact other code points
  * Code is fragile.


### Open/Closed Principle

* The classes or methods should be open for extension and closed for changes, that is, if a behavior / rule need to change, should be to create new code, rather than change the existing code.
* A new behavior should be added without change the old code.
* Class should be more abstract to facilitate maintenance


### Liskov Substitution Principle

* A subclass can be changed by the superclass.
* If the superclass interface is known, the subclass must also be, as it should have the same implementations.


### Interface Segregation Principle

* Subclasses should not depend on methods that do not use.
* When a subclass inherits methods that she does not use, but which are used by other subclasses,
any change in these methods can affect the class even if it does not use these methods.
* A class should not be forced to inherit methods that will not use


### Dependency Inversion Principle

* High level modules should not depend on low-level modules, both should depend on abstractions
* Abstractions should not depend on details, details should depend on abstractions.
