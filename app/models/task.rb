class Task < ActiveRecord::Base
	has_many :subtasks
	belongs_to :roadmap
	has_many :documents
	 has_many :comments

  has_many :document_comments

end
