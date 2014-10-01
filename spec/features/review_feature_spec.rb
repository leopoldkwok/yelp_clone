require 'rails_helper'

describe 'reviewing' do
	before do
		Restaurant.create(name: 'KFC') # it will create a new instance of the restaurant and set the name to KFC
	end

	def leave_review(thoughts, rating)
	# it 'allows users to leave a review using a form' do
		visit '/restaurants'
		click_link 'Review KFC'
		fill_in "Thoughts", with: thoughts
		select rating, from: 'Rating'
		click_button 'Leave Review'

		# expect(current_path).to eq '/restaurants'
		# expect(page).to have_content('so so')
	end

	it "allows users to leave review using the form which appear alongside restaurant" do
		leave_review("So so","3")
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'So so'
	end

	it "displays an average rating for all reviews" do 
		leave_review("So so", "3")
		leave_review('Great', "5")
		expect(page).to have_content("Average rating: ★★★★☆")
	end


	it "displays a posted time for the post" do 
		leave_review("So so", "3")
		expect(page).to have_content("Posted: less than a minute ago")
	end

end