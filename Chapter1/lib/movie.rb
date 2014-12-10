require_relative './regular_price'
require_relative './new_release_price'
require_relative './childrens_price'

class Movie
   REGULAR = 0
   NEW_RELEASE = 1
   CHILDRENS = 2

   attr_reader :title
   attr_reader :price_code
   attr_writer :price

   def price_code=(value)
      @price_code = value
   end

   def initialize(title, the_price_code)
      @title, self.price_code = title, the_price_code
      self.price = the_price_code
   end

   def charge(days_rented)
      @price.charge(days_rented)
   end

   def frequent_renter_points(days_rented)
      @price.frequent_renter_points(days_rented)
   end
end

