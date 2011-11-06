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
      result = "Rental Record for #{@name}\n"
      @rentals.each do |element|
         # show figures for this rental
         result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      end

      # add footer lines
      result += "Amount owed is #{total_charge}\n"
      result += "You earned #{total_frequent_renter_points} frequent renter points"
      result
   end

   def html_statement
      result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
      @rentals.each do |element|
         result += "\t" + element.movie.title + ": " + element.charge.to_s + "<br>\n"
      end
      result += "<p>You owe <em>#{total_charge}</em><p>\n"
      result += "On this rental you earned " +
         "<em>#{total_frequent_renter_points}</em> " +
         "frequent renter points<p>"
      result
   end

   private

   def total_charge
      @rentals.inject(0) { |sum, rental| sum + rental.charge }
   end

   def total_frequent_renter_points
      @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
   end



end


