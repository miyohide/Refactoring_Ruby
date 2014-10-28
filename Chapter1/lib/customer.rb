class Customer
   attr_reader :name

   def initialize(name)
      @name = name
      @rentals = []
   end

   def add_rental(arg)
      @rentals << arg
   end
end

