class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3}, uniqueness: true

	def average_rating 
		return 'N/A' if reviews.none?
		reviews.average(:rating)
		# reviews.inject(0) {|memo, review|review|memo + review.rating} /reviews.count - this is the long way
	end



end