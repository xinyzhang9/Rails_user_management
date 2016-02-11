class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email_address,presence:true,format:{with:EMAIL_REGEX},uniqueness:{case_sensitive: false}
	validates :first_name,:last_name,:password,presence:true
	validates :password,length:{minimum:5,maximum:8}
	before_save do
		self.email_address.downcase!
	end
end
