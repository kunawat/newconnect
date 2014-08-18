class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :password, :gender, :linked_in, :date_of_birth, :about_me, :contact_no, :email
	attr_accessor :password

	validates :first_name, :last_name, :password, :username, :presence => true
	validates :username, :email,  :uniqueness => true

	before_save :create_hashed_password
	after_save :erase_password

	has_many :messages

	private

	def create_hashed_password
		unless password.blank?
			self.hashed_password = AdminUser.create_hashed_password(password)
		end
	end

	def	erase_password
		self.password = nil	
	end
	
end