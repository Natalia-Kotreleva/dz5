module NameCompany
  attr_accessor :name_company
end

module InstanceCounter
  attr_accessor :register


  def self.included(base)
    base.extend InstancesClass
  end

  module InstancesClass
    def instances
      return ObjectSpace.each_object(self).count
    end
  end

  protected

  def register_instance(nameClass)
    @register = ObjectSpace.each_object(nameClass).count.to_i+1 
  end 
end

