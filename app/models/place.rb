class Place < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true, length: { minimum: 3, maximum: 254 }

	def self.search(category, location)
		location = URI.encode(location)
    search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{category}+in+#{location}&key=AIzaSyDSNCeNSD64AM7KxZ3kK1kLEQcku_UYzns"
		api_response = HTTParty.get(search_url)
		api_response['results']
	end

end
