class Place < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: { minimum: 3, maximum: 254 }

	def self.kind_place(kind_place)
		kind_place = URI.encode(kind_place)
		search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{kind_place}&key=AIzaSyDSNCeNSD64AM7KxZ3kK1kLEQcku_UYzns"
		api_response = HTTParty.get(search_url)
		api_response['results']
	end


	def self.location(location)
    location = URI.encode(location)
		search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{location}&key=AIzaSyDSNCeNSD64AM7KxZ3kK1kLEQcku_UYzns"
    api_response = HTTParty.get(search_url)
		api_response['results']
  end

	# def self.search(location)
	# 	location = URI.encode(location)
	# 	location = URI.encode(location)
	# 	search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars+in+#{location}&key=AIzaSyDSNCeNSD64AM7KxZ3kK1kLEQcku_UYzns"
	# 	api_response = HTTParty.get(search_url)
	# 	api_response['results']
	# end


end


