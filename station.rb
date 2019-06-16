load 'modules.rb' 

class Station
  include InstanceCounter

  attr_accessor :trains, :name_station

  def initialize(name_station)
    @name_station = name_station
    @trains = []
    register_instance(Station)
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def train_arrives(train)
    @trains.push(train)
  end

  def trains_type
    cargo_trains = @trains.count { |train| train.type == :cargo }
    passenger_trains = @trains.count { |train| train.type == :passenger }
  "cargo: #{cargo_trains}, passenger: #{passenger_trains}"
  end

  def Station.all
    print ObjectSpace.each_object(self).to_a
  end

end

