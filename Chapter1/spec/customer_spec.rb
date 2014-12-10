require_relative 'spec_helper'

describe Customer do
   describe '#statement' do
      describe 'REGULAR movie' do
         describe 'Rented days is 2' do
            before do
               regular_movie = Movie.new('regular movie', RegularPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(regular_movie, 2))
            end

            it { @customer.statement.must_match /Amount owed is 2/ }
            it { @customer.statement.must_match /You earned 1 frequent renter points/ }
         end

         describe 'Rented days is 3' do
            before do
               regular_movie = Movie.new('regular movie', RegularPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(regular_movie, 3))
            end

            it { @customer.statement.must_match /Amount owed is 3.5/ }
         end
      end

      describe 'NEW RELEASE movie' do
         before do
            new_release_movie = Movie.new('new release movie', NewReleasePrice.new)
            @customer = Customer.new('Customer name')
            @customer.add_rental(Rental.new(new_release_movie, 2))
         end

         it { @customer.statement.must_match /Amount owed is 6/ }
         it { @customer.statement.must_match /You earned 2 frequent renter points/ }
      end

      describe 'CHILDRENS movie' do
         describe 'Rented days is 3' do
            before do
               children_movie = Movie.new('children movie', ChildrensPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(children_movie, 3))
            end

            it { @customer.statement.must_match /Amount owed is 1.5/ }
            it { @customer.statement.must_match /You earned 1 frequent renter points/ }
         end

         describe 'Rented days is 4' do
            before do
               children_movie = Movie.new('children movie', ChildrensPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(children_movie, 4))
            end

            it { @customer.statement.must_match /Amount owed is 3/ }
         end
      end

      describe 'ALL movie type' do
         before do
            regular_movie = Movie.new('regular movie', RegularPrice.new)
            new_release_movie = Movie.new('new release movie', NewReleasePrice.new)
            children_movie = Movie.new('children movie', ChildrensPrice.new)
            @customer = Customer.new('Customer name')
            @customer.add_rental(Rental.new(regular_movie, 4))
            @customer.add_rental(Rental.new(new_release_movie, 4))
            @customer.add_rental(Rental.new(children_movie, 4))
         end

         it { @customer.statement.must_match /Amount owed is 20/ }
      end
   end

   describe '#html_statement' do
      describe 'REGULAR movie' do
         describe 'Rented days is 2' do
            before do
               regular_movie = Movie.new('regular movie', RegularPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(regular_movie, 2))
            end

            it { @customer.html_statement.must_match /<p>You owe <em>2<\/em><p>/ }
            it { @customer.html_statement.must_match /On this rental you earned <em>1<\/em> frequent renter points<p>/ }
         end

         describe 'Rented days is 3' do
            before do
               regular_movie = Movie.new('regular movie', RegularPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(regular_movie, 3))
            end

            it { @customer.html_statement.must_match /<p>You owe <em>3\.5<\/em><p>/ }
         end
      end

      describe 'NEW RELEASE movie' do
         before do
            new_release_movie = Movie.new('new release movie', NewReleasePrice.new)
            @customer = Customer.new('Customer name')
            @customer.add_rental(Rental.new(new_release_movie, 2))
         end

         it { @customer.html_statement.must_match /<p>You owe <em>6<\/em><p>/ }
         it { @customer.html_statement.must_match /On this rental you earned <em>2<\/em> frequent renter points<p>/ }
      end

      describe 'CHILDRENS movie' do
         describe 'Rented days is 3' do
            before do
               children_movie = Movie.new('children movie', ChildrensPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(children_movie, 3))
            end

            it { @customer.html_statement.must_match /<p>You owe <em>1\.5<\/em><p>/ }
            it { @customer.html_statement.must_match /On this rental you earned <em>1<\/em> frequent renter points<p>/ }
         end

         describe 'Rented days is 4' do
            before do
               children_movie = Movie.new('children movie', ChildrensPrice.new)
               @customer = Customer.new('Customer name')
               @customer.add_rental(Rental.new(children_movie, 4))
            end

            it { @customer.html_statement.must_match /<p>You owe <em>3\.0<\/em><p>/ }
         end
      end

      describe 'ALL movie type' do
         before do
            regular_movie = Movie.new('regular movie', RegularPrice.new)
            new_release_movie = Movie.new('new release movie', NewReleasePrice.new)
            children_movie = Movie.new('children movie', ChildrensPrice.new)
            @customer = Customer.new('Customer name')
            @customer.add_rental(Rental.new(regular_movie, 4))
            @customer.add_rental(Rental.new(new_release_movie, 4))
            @customer.add_rental(Rental.new(children_movie, 4))
         end

         it { @customer.html_statement.must_match /<p>You owe <em>20\.0<\/em><p>/ }
      end
   end
end
