class Animal
  def walk
    puts 'walking...'
  end
  def run
    puts 'método abstrato'
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

animals = 10.times.map { Animal.new } + 10.times.map { Dog.new }
animals.map &:run
