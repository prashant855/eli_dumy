class GoogleCustomeSearch
	include HTTParty
	include Api::CoreApi

	base_uri 'https://www.googleapis.com'

	def initialize search 
		core = core_api_values
		key = core['KEY']
		cx = core['CX']
		@options = { query: { key: key, cx: cx, q: search } }
	end 

	def response_data
    	self.class.get('/customsearch/v1', @options)
   	end

end 