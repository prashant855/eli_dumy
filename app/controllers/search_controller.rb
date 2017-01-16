class SearchController < ApplicationController

	def google 
	end

	def google_search
	
		google_search_api = GoogleCustomeSearch.new(params[:q])
		data = google_search_api.response_data

		if data && data['items'].present?
			@arrays_of_links = data['items'].map{|i| i['link']}
			
			@arrays_of_links.each do |link|
				OrganicLink.create(link: link, search: params[:q])
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
end 