class Rental
   attr_reader :movie, :days_rented
   def initialize(movie, days_rented)
      @movie, @days_rented = movie, days_rented
   end

   def charge
      movie.charge(days_rented)
   end

   def frequent_renter_points
      # 新作2日間レンタルでボーナス点を加算
      (movie.price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
   end
end

