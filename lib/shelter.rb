require 'pry'
class Shelter
  attr_reader :name, :capacity, :pets
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @pets = []
  end

  def add_pet(name)
    @pets << name
  end 

  def call_pets
    @pets.map do |name|
     "#{name}!" 
    end 
  end

  def over_capacity?
    @pets.count > @capacity
  end

  def adopt
    if over_capacity? == true 
      @pets.shift until over_capacity? == false
    end
  end
end