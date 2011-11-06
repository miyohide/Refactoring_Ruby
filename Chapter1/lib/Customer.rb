require './lib/Movie'
require './lib/Rental'

class Customer
   attr_reader :name

   def initialize(name)
      @name = name
      @rentals = []
   end

   def add_rental(arg)
      @rentals << arg
   end

   def amount_for(rental)
      rental.charge
   end

   def statement
      frequent_renter_points = 0
      result = "Rental Record for #{@name}\n"
      @rentals.each do |element|
         # add frequent renter points
         frequent_renter_points += element.frequent_renter_points
         # add bonus for a two day new release rental
         # show figures for this rental
         result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      end

      # add footer lines
      result += "Amount owed is #{total_charge}\n"
      result += "You earned #{frequent_renter_points} frequent renter points"
      result
   end

   private

   def total_charge
      result = 0
      @rentals.each do |element|
         result += element.charge
      end
      result
   end


end


