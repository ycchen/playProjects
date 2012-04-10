class Project < ActiveRecord::Base
	validates :name, :description, :presence => true
end
