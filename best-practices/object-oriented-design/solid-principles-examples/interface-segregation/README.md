###### Interface Segregation Principle

- Subclasses should not depend on methods that do not use.
- When a subclass inherits methods that she does not use, but which are used by other subclasses,
any change in these methods can affect the class even if it does not use these methods.
- A class should not be forced to inherit methods that will not use
