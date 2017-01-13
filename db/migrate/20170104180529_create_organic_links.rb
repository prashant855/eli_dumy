class CreateOrganicLinks < ActiveRecord::Migration
  def change
    create_table :organic_links do |t|
      t.string :name
      t.string :link
      t.string :search
      t.string :options

      t.timestamps null: false
    end
  end
end
