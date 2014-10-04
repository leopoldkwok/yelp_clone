require 'rails_helper'

describe 'restaurants' do 
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'restaurants have been added' do
		
		before do
			Restaurant.create(name: 'KFC', cuisine: 'Fast food')
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content('KFC')
			expect(page).not_to have_content('No restaurants yet')
		end

	end

end

describe "creating restaurants" do
	it "prompts user to fill a out a form , then displays the new restaurant" do
		visit '/restaurants'
		click_link "Add a restaurant"
		fill_in 'Name', with: 'KFC'
		fill_in 'Cuisine', with: 'Fast food'
		fill_in 'Description', with: 'Late night food, hungover food, etc'
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(current_path).to eq '/restaurants'
	end
end


describe 'editing restaurants' do 
		before do
			Restaurant.create(name: 'KFC')
		end
	it "can allow a user to edit a restaurant" do
		visit '/restaurants'
		click_link 'Edit KFC' 
		fill_in 'Name', with: 'Kentucky fried chicken'
		fill_in 'Cuisine', with: 'Chicken'
		click_button 'Update Restaurant'
		expect(page).to have_content 'Kentucky fried chicken'
		expect(current_path).to eq '/restaurants'
	end

end

describe 'deleting restaurants' do 
		before do
			Restaurant.create(name: 'KFC')
		end

	it 'removes a restaurant when a user clicks a delte link' do
		visit '/restaurants'
		click_link 'Delete KFC'
		expect(page).not_to have_content 'KFC'
		expect(page).to have_content 'Restaurants deleted successfully'
		end

end

describe 'viewing the description of the restaurant' do
	before do
		Restaurant.create(name: 'KFC', cuisine: 'Chicken')
	end

	it 'brings you to the restaurant page when you click on it' do
		visit '/restaurants'
		click_link 'KFC'
		expect(page).to have_content 'KFC'
		expect(page).to have_content 'Chicken'
	end
end

describe 'creating restaurants' do
	context 'a valid restaurant' do
		it "prompts user to fill out a form , then displays the new restaurant" do
		visit '/restaurants'
		click_link "Add a restaurant"
		fill_in 'Name', with: 'KFC'
		# fill_in 'Cuisine', with: 'Fast food'
		# fill_in 'Description', with: 'Late night food, hungover food, etc'
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(current_path).to eq '/restaurants'
		end

	end

	context 'an invalid restaurant' do
	it 'does not let you submit without a name that is too short' do	
		visit '/restaurants'
		click_link 'Add a restaurant'
		fill_in	 'Name', with: 'KF'
		click_button 'Create Restaurant'
		expect(page).not_to have_css 'h2', text: 'kf'
		expect(page).to have_content 'error'
		end

	end
end

# before :each do
# 	@file = fixture_file_upload('files/test_lic.xml','text/xml')
# end

# it 'can upload a license' do 
# 	post :uploadLicense, :upload =>@file 
# 	response.should be_success
# end



