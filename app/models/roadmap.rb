class Roadmap < ActiveRecord::Base
	has_many :tasks
	belongs_to :user
  ratyrate_rateable "roadmap"
end
