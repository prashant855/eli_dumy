class SearchController < ApplicationController

	def google 
	end

	def google_search
		data = response_values
		if data['items'].present?
			@arrays_of_links = data['items'].map{|i| i['link']}
			
			@arrays_of_links.each do |link|
				OrganicLink.create(link: link,
								   search: params[:q])
			end
			
			respond_to do |format|
	      		format.html { redirect_to organic_links_url, notice: 'Organic link successfully created.....' }
	    	end
	    else
	    	respond_to do |format|
	      		format.html { redirect_to root_path, notice: 'No Result Found.....' }
	    	end
	    end
	end

	private
# Holding core and cxs values
	def core_api
		YAML.load_file("config/core_api.yml")
	end
# Get the response values of custome search api's
	def response_values
		core = core_api
		response = HTTParty.get("https://www.googleapis.com/customsearch/v1?key=#{core["KEY"]}&cx=#{core["CX"]}&q=#{params[:q]}")
		JSON.parse(response.body)
	end 

end 