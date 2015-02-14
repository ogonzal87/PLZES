class Place < ActiveRecord::Base

	def self.search
		search_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyDSNCeNSD64AM7KxZ3kK1kLEQcku_UYzns&location=33,-84&rankby=distance&keyword=coffee"
		api_response = HTTParty.get(search_url)
		api_response['results']
	end
end
