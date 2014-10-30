require_relative 'spec_helper'

describe Customer do
   describe '#statement' do
      describe 'REGULAR movie' do
         describe 'Rented days is 2' do
            before do
               regular_movie = Movie.new('regular movie', Movie::REGULAR)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(regular_movie, 2))
            end

            it { @customer.statement.must_match /Amount owed is 2/ }
            it { @customer.statement.must_match /You earned 1 frequent renter points/ }
         end

         describe 'Rented days is 3' do
            before do
               regular_movie = Movie.new('regular movie', Movie::REGULAR)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(regular_movie, 3))
            end

            it { @customer.statement.must_match /Amount owed is 3.5/ }
         end
      end

      describe 'NEW RELEASE movie' do
         before do
            new_release_movie = Movie.new('new release movie', Movie::NEW_RELEASE)
            @customer = Customer.new('Customer name')
            @customer.add_rental(Rental.new(new_release_movie, 2))
         end

         it { @customer.statement.must_match /Amount owed is 6/ }
         it { @customer.statement.must_match /You earned 2 frequent renter points/ }
      end

      describe 'CHILDRENS movie' do
         describe 'Rented days is 3' do
            before do
               children_movie = Movie.new('children movie', Movie::CHILDRENS)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(children_movie, 3))
            end

            it { @customer.statement.must_match /Amount owed is 1.5/ }
            it { @customer.statement.must_match /You earned 1 frequent renter points/ }
         end

         describe 'Rented days is 4' do
            before do
               children_movie = Movie.new('children movie', Movie::CHILDRENS)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(children_movie, 4))
            end

            it { @customer.statement.must_match /Amount owed is 3/ }
         end
      end

      describe 'ALL movie type' do
         before do
            regular_movie = Movie.new('regular movie', Movie::REGULAR)
            new_release_movie = Movie.new('new release movie', Movie::NEW_RELEASE)
            children_movie = Movie.new('children movie', Movie::CHILDRENS)
            @customer = Customer.new('Customer name')
            @customer.add_rental(Rental.new(regular_movie, 4))
            @customer.add_rental(Rental.new(new_release_movie, 4))
            @customer.add_rental(Rental.new(children_movie, 4))
         end

         it { @customer.statement.must_match /Amount owed is 20/ }
      end
   end
end
