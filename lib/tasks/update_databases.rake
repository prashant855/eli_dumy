namespace :update_databases do
	desc "ToDo"

	task :update_table_withoutlinks => :environment do
		OrganicLink.delete_all(link: nil)
	end
end 