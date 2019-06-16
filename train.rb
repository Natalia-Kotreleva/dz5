load 'modules.rb' 

class Train
  include NameCompany
  include InstanceCounter

  attr_reader :route, :speed, :wagon, :name_train, :station, :number
  attr_accessor :wagons

  def initialize(name_train)
    @name_train = name_train
    @speed = 0
    @wagons = []
    @name_company = "company"
    @number = rand(100)
    register_instance(Train)
  end
  

  def speed_increase(value)
    @speed += value if value > 0 
  end

  def speed_decrease(value)
    @speed -= value
    @speed = 0 if @speed < 0 
  end

  def set_route(route)
    @route = route
    @station = route.stations[0]
    route.stations[0].train_arrives(self)
  end

  def station_next
    if @station != @route.stations.last
      @station = @route.stations[@route.stations.index(@station) + 1]
    end
  end

  def station_prev
    if @route.stations.index(@station) != 0  
      @station = @route.stations[@route.stations.index(@station) - 1]
    end
  end

  def station_return
    "#{@route.stations[@route.stations.index(@station) - 1].name_station}, #{@station.name_station}, #{@route.stations[@route.stations.index(@station) + 1].name_station}"
  end

  def Train.find(number)
    ObjectSpace.each_object(self).each { |train|
      return train if train.number == number
    }
  end

end
