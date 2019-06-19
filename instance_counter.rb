module InstanceCounter
  @@instance_count = 0
  @@register = 0
  
  def count
    @@instance_count += 1
  end
 
  def self.included(base)
    base.extend(Instances)
  end
  
  module Instances

    def self.instances
      @@instance_count
    end
  end

  protected

  def register_instance
    @@register += 1
  end 
end

