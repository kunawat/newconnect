class Poll < ActiveRecord::Base
 	attr_accessible :end_date, :question, :state, :created_by
	#attr_accessor :option1,:option2, :option3, :option4, :option5 
	#validates :end_date, :question, presence: true

	has_many :poll_users
	has_many :poll_options


	before_save :upstate 
	after_save :downstate 

	private

	def upstate
		self.state = true
	end

	def	downstate	
	end

end

