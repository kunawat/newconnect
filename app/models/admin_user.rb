require 'digest/sha1'
class AdminUser < ActiveRecord::Base
  # attr_accessible :title, :body
	def self.authenticate_user(username, password)
		if(user = User.find_by_username(username))
			if(AdminUser.create_hashed_password(password) == user.hashed_password )
				return user;
			end
		end
		return false;

	end	

	def self.create_hashed_password(password)
		return Digest::SHA1.hexdigest("The hashed password has #{password}")
	end


end
