class Review < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
		validates :rating, :inclusion => {:in => [1,2,3,4,5]}

end
