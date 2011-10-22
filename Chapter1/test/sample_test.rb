require 'test/unit'
require './lib/Customer'

class CustomerTest < Test::Unit::TestCase

   def test_Regular
      c = Customer.new("regular")
      m = Movie.new("regular-1", Movie::REGULAR)
      c.add_rental(Rental.new(m,1))

      assert_equal("Rental Record for regular\n\tregular-1\t2\nAmount owed is 2\nYou earned 1 frequent renter points",
                   c.statement)
   end

   def test_Regular_rentday_is_3
      c = Customer.new("regular")
      m = Movie.new("regular-1", Movie::REGULAR)
      c.add_rental(Rental.new(m,3))

      assert_equal("Rental Record for regular\n\tregular-1\t3.5\nAmount owed is 3.5\nYou earned 1 frequent renter points",
                   c.statement)
   end

   def test_NEW_RELEASE
      c = Customer.new("new_release")
      m = Movie.new("new_release-1", Movie::NEW_RELEASE)
      c.add_rental(Rental.new(m,1))

      assert_equal("Rental Record for new_release\n\tnew_release-1\t3\nAmount owed is 3\nYou earned 1 frequent renter points",
                   c.statement)
   end

   def test_NEW_RELEASE_rentday_is_2
      c = Customer.new("new_release")
      m = Movie.new("new_release-1", Movie::NEW_RELEASE)
      c.add_rental(Rental.new(m,2))

      assert_equal("Rental Record for new_release\n\tnew_release-1\t6\nAmount owed is 6\nYou earned 2 frequent renter points",
                   c.statement)
   end

   def test_CHILDRENS
      c = Customer.new("children")
      m = Movie.new("children-1", Movie::CHILDRENS)
      c.add_rental(Rental.new(m,1))

      assert_equal("Rental Record for children\n\tchildren-1\t1.5\nAmount owed is 1.5\nYou earned 1 frequent renter points",
                   c.statement)
   end

   def test_CHILDRENS_rentday_is_4
      c = Customer.new("children")
      m = Movie.new("children-1", Movie::CHILDRENS)
      c.add_rental(Rental.new(m,4))

      assert_equal("Rental Record for children\n\tchildren-1\t3.0\nAmount owed is 3.0\nYou earned 1 frequent renter points",
                   c.statement)
   end

   def test_Regular_and_NEW_RELEASE
      c = Customer.new("regular")
      m = Movie.new("regular-1", Movie::REGULAR)
      c.add_rental(Rental.new(m,3))

      m = Movie.new("new_release-1", Movie::NEW_RELEASE)
      c.add_rental(Rental.new(m,1))

      assert_equal("Rental Record for regular\n\tregular-1\t3.5\n\tnew_release-1\t3\nAmount owed is 6.5\nYou earned 2 frequent renter points",
                   c.statement)
   end

end

