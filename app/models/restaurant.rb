class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3}, uniqueness: true
  	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default => "/images/:style/missing.png",
 					  :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials}
	
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	


                  

  def s3_credentials
    {:bucket => "yelpcloneauglk", :access_key_id => Rails.application.secrets.aws_app_id, :secret_access_key => Rails.application.secrets.aws_app_secret}
  end


	def average_rating 
		return 'N/A' if reviews.none?
		reviews.average(:rating)
		# reviews.inject(0) {|memo, review|review|memo + review.rating} /reviews.count - this is the long way
	end



end