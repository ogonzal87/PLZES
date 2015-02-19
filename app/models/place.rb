class Place < ActiveRecord::Base
	belongs_to :user

	def self.search(location)
		location = URI.encode(location)
		search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars+in+#{location}&key=AIzaSyDSNCeNSD64AM7KxZ3kK1kLEQcku_UYzns"
		api_response = HTTParty.get(search_url)
		api_response['results']
	end
end


