class Place
	def self.search
		search_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyDN-WyapDlaLVbsJiYKWUODGJfgcN6AR34&location=33,-84&rankby=distance&keyword=coffee"
		response = HTTParty.get(search_url)		
		response['results']
	end
end