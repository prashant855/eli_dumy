class OrganicLink < ActiveRecord::Base


	validates :link, :search, :presence => true
	validates_uniqueness_of :link, :scope => :search


end
