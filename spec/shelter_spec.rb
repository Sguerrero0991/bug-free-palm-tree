require 'rspec'
require './lib/shelter'

RSpec.describe Shelter do

  # Iteration 1
  describe '#initialize' do
    it 'is a Shelter' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      expect(shelter).to be_a(Shelter)
    end

    it 'can read the name' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      expect(shelter.name).to eq('Denver Animal Shelter')
    end

    it 'can read the capacity' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      expect(shelter.capacity).to eq(3)
    end

    it 'has no pets by default' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      expect(shelter.pets).to eq []
    end
  end

  # Iteration 2
  describe '#add_pet' do
    it 'returns a list of pets' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')
      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      expect(shelter.pets).to eq(['Salem', 'Beethoven', 'Spot', 'Jonesy'])
    end
  end 

  describe '#call_pets' do
    it 'returns a list of names with exclamation points appended' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')
      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      expect(shelter.call_pets).to eq(['Salem!', 'Beethoven!', 'Spot!', 'Jonesy!'])
    end
  end 

  describe '#over_capacity?' do
    it 'will check if shelter is over capacity after pets are added' do
      shelter = Shelter.new('Denver Animal Shelter', 3)
      shelter2 = Shelter.new('Chicago Animal Shelter', 0)

      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')

      shelter2.add_pet('BoBo')
      shelter2.add_pet('Zero')

      expect(shelter.over_capacity?).to eq(false)
      expect(shelter2.over_capacity?).to eq(true)

      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      shelter2.add_pet('Benji')

      expect(shelter.over_capacity?).to eq(true)
      expect(shelter2.over_capacity?).to eq(true)
    end 
  end 

  describe '#adopt' do
    it 'will remove pets until no longer at capacity' do
      shelter = Shelter.new('Denver Animal Shelter', 3)

      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')
      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      shelter.adopt

      expect(shelter.over_capacity?).to eq(false)
      expect(shelter.pets).to eq(['Beethoven', 'Spot', 'Jonesy'])
    end
  end 
end