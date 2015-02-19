# Superclass Car has methods that are inherited for Driver and Mechanic, but none of subclasses use all methods
class Car
  def open_door
    puts 'opening door...'
  end

  def start_engine
    puts 'vrumm'
  end

  def change_engine
    puts 'tec tecc'
  end
end

class Driver < Car
  def initialize(car)
    @car = car
  end

  def drive
    @car.open_door
    @car.start_engine
  end
end

class Mechanic
  def initialize(car)
    @car = car
  end

  def fix
    @car.change_engine
  end
end
