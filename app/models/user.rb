class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name,:pic, :username, :password, :gender, :online, :linked_in, :date_of_birth, :about_me, :contact_no, :email
	attr_accessor :password

	validates :first_name, :last_name, :username, :presence => true
	validates :username, :email,  :uniqueness => true

	has_attached_file :pic, :styles =>  { :medium => "250x200>" }

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
