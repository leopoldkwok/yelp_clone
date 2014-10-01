require 'rails_helper'

RSpec.describe Review, :type => :model do 
		it "should be able to accept a rating between 1 and 5" do 
			review = Review.new(rating: 1)
			expect(review).to be_valid
		end

		it "is not valid with a number outside 1-5" do 
			review = Review.new(rating: 100)
			# expect(review).to have(1).error_on(:rating)
			expect(review).not_to be_valid
		end

		

end