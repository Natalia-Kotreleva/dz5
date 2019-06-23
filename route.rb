load 'instance_counter.rb' 

class Route
  include InstanceCounter

  attr_accessor :stations, :route_name

  def initialize(first_station, final_station, route_name)
    @stations = [first_station, final_station]
    @route_name = route_name
    register_instance
  end
    
  def station_add(station)
    @stations.insert(-2, station)
  end

  def station_delete(station)
    @stations.delete(station)
  end
end

