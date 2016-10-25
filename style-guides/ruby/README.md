# Ruby

## Style

* Insert spaces around operators, commas, colons, semicolons, `{` and before `}`.

```ruby
hash = { key: value }
sum = 1 + 2
collection.each { |elem| puts elem }

def some_method(name, status = 'active')
  # ...
end
```

* Add spaces around `=` when assigning default values in method arguments.

```ruby
# Instead of this...
def some_method(name, status='active')
  # ...
end

# ...You should do this.
def some_method(name, status = 'active')
  # ...
end
```

* Don't put spaces around `(`, `[` and before `)` or `]`.

```ruby
values = [1, 2, 3]
filter(values)
```

* Add a blank line between method definitions.

```ruby
def initialize(var)
  @var = var
end

def filter(values)
  values.select { |value| value.allowed? }
end
```

* Don't add a blank line after a class, method, spec definition or before their respective `end`.

```ruby
# Instead of this...
class MyClass

  def my_method

    # ...

  end

end

# ...You should do this.
class MyClass
  def my_method
    # ...
  end
end
```

* Indent private methods at the same column as the public methods.

```ruby
class SomeClass
  def find(name)
    # ...
  end

  private

  def update_cached_values
    # ...
  end
end
```

* Indent `when` as deep as `case`. Do the same for `if` and `else` as well.

```ruby
case
when song.name == 'Misty'
  puts 'Not again!'
when song.duration > 120
  puts 'Too long!'
when Time.now.hour > 21
  puts "It's too late"
else
  song.play
end

kind = case year
       when 1850..1889 then 'Blues'
       when 1890..1909 then 'Ragtime'
       when 1910..1929 then 'New Orleans Jazz'
       when 1930..1939 then 'Swing'
       when 1940..1950 then 'Bebop'
       else 'Jazz'
       end

result = if something
           'that'
         else
           'this'
         end
```

Use the same style for arguments:

```ruby
this_is_an_example(first: 1,
                   second: 2)
```

## Methods

* When defining methods don't use parentheses for methods that don't take arguments. Use parentheses only for methods that accept arguments.

```ruby
def save
  # ...
end

def create(name, age)
  # ...
end
```

* Prefer named params but with caution. Use it when aggregates value to code readability.

```ruby
# Instead of this...
class Stock
  def self.add(product: required, quantity: 1)
    # ...
  end
end

class Calculator
  def self.sum(x: required, y: required)
    # ...
  end
end

# ...You should do this.
class Stock
  def self.add(product, quantity: 1)
    # ...
  end
end

class Calculator
  def self.sum(x, y)
    # ...
  end
end
```

It won't agreggates value:

```ruby
Stock.add product: some_product, quantity: 2
Stock.add product: other_product

Calculator.sum x: 1, y: 2
```

It will agregattes value:

```ruby
Stock.add some_product, quantity: 2
Stock.add other_product

Calculator.sum 1, 2
```

* Prefer a clear method call. It means that don't use `(` and `)` as possible.

```ruby
Calculator.sum 1, 2
```

## Namming

### Class

* Use `CamelCase` format for names.

### Method

* `snake_case` format for name.
* Use infinitive verbs.

```ruby
# Instead of this...
def creating
  # ...
end

# ...You should do this.
def create
  # ...
end
```

* Names of predicate methods should end with `?`.

```ruby
# Instead of this...
def empty
  # ...
end

# ...You should do this.
def empty?
  # ...
end
```

### Variable

* `snake_case` format for name.
* Avoid types in names.

```ruby
# Instead of this...
people_array = Person.all

# ...You should do this.
people = Person.all
```

### Constant

* `SCREAMING_SNAKE_CASE` format for name.

## Syntax

* Always use `&&` and `||` for boolean expressions. Do not use `and` and `or` to avoid precedence issues.

```ruby
if something && other
  do_this
end
```

* Don't use `unless` with `else`. Switch the clauses and use `if` instead.

```ruby
# Instead of this...
unless success?
  puts 'failure'
else
  puts 'success'
end

# ...You should do this.
if success?
  puts 'success'
else
  puts 'failure'
end
```

* Don't use `then` for multi-line `if/unless`.

```ruby
# Avoid this
if something then
  do_that
end
```

* When having a single-line body for a conditional consider using the `if/unless` modifier.

```ruby
do_this if something
```

* Don't use `for` unless you have a very good reason. Use `each` instead.
* Avoid `return` when not required.

```ruby
# Instead of this...
def filter(values)
  return values.select { |value| value.allowed? }
end

# ...you should do this.
def filter(values)
  values.select { |value| value.allowed? }
end
```

* Avoid `self` when not required.

```ruby
# Instead of this...
def big_name
  self.name * 50
end

# ...you should do this.
def big_name
  name * 50
end
```

* Use `_` for unused block parameters.

```ruby
# Instead of this...
hash.map { |k, v| v + 1 }

# ...you should do this.
hash.map { |_, v| v + 1 }
```

* Use `attr_*` to define trivial methods.

```ruby
# Instead of this...
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

# ...you should do this.
class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
```

* When defining class methods use def self.method if there isn't too many methods (at least 3). If there's too much prefer using class << self.
* Use implicit begin blocks.

```ruby
# Instead of this...
def method
  begin
    do_something
  rescue SomeError => e
    puts e
  end
end

# ...you should do this.
def method
  do_something
rescue SomeError => e
  puts e
end
```

* If you're defining a class that doesn't have any methods, or empty methods, do it in a single-line. This happens a lot when defining exceptions.

```ruby
# Instead of this...
class MyClass
end

class MyError < StandardError
end

class SomeRailsController
  # other methods...
  
  def show
  end
end

# ...you should do this.
class MyClass; end

class MyError < StandardError; end

class SomeRailsController
  def show; end
end
```

* Use `{...}` for single-line blocks instead of `do...end`. For multi-line blocks use `do...end`.

```ruby
# Instead of this...
people.each { |person|
  # lots
  # of
  # stuff
  # happening
  # here
}

people.each do |person|
  puts person.name
end

# ...you should do this.
people.each do |person|
  # lots
  # of
  # stuff
  # happening
  # here
end

people.each { |person| puts person.name }
```

* Signal exceptions using raise. Use fail only if the exception should not be catched.

```ruby
begin
  raise 'Unexpected'
rescue => e
  fail if e.message == 'Can not be handled'
end
```

## Data syntax

* Use the new hash syntax when using Ruby 1.9.

```ruby
# Ruby 1.8
h = { :key => value }

# Ruby 1.9
h = { key: value }
```

* When possible, use double-quoted strings only when interpolation is required. However, since it is common to work with generated files that use double-quoted strings by default, feel free to rely on the current file style.

```ruby
# Instead of this...
name = "John Doe"

# ...you should do this.
name = 'John Doe'
```

* Use `%()` to define single-line strings which require interpolation and embedded double-quotes. For multi-line strings, prefer heredocs.

```ruby
# This is good
%(<div class="my-class">#{my_content}</div>)

# Instead of this...
%(<div>\n<span class="my-class">Content</span>\n</div>)

# ...you should do this.
<<-STR
<div>
  <span class="my-class">Content</span>
</div>
STR
```

* Use `%w` to define an array of strings.

```ruby
# Instead of this...
names = ['John', 'Rose', 'Greg']

# ...you should do this.
names = %w(John Rose Greg)
```
