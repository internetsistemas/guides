class Person; end

class NaturalPerson < Person
  def save_natural() end
end

class JuridicalPerson < Person
  def save_juridical() end
end

persons = 10.times.map { Person.new }
persons.each do |person|
  person.save_natural if person.is_a?(NaturalPerson)
  person.save_juridical if person.is_a?(JuridicalPerson)
end

class Animal
  def walk
    puts 'walking...'
  end
end

class Cat < Animal
  def run
    puts 'running like a cat'
  end
end

class Dog < Animal
  def run
    puts 'running like a dog'
  end
end

animals = 10.times.map { Animal.new }
animals.map &:run
