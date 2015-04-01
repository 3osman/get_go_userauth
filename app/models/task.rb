class Task < ActiveRecord::Base
	has_many :subtasks
	belongs_to :roadmap
	has_many :documents
end
