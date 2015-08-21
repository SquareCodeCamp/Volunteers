require "digest"

class User < ActiveRecord::Base
	has_and_belongs_to_many :events

	attr_accessor :password # create password getter and setter
	before_save :encrypt_password

	def encrypt_password
		sha256 = Digest::SHA256.hexdigest password 
		self.encrypted_password = sha256
	end

	def valid_password?(pw)
		encrypted_password == Digest::SHA256.hexdigest(pw)
	end

end
