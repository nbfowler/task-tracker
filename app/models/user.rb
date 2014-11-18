class User < ActiveRecord::Base
	has_many :tasks

  validates :name, :email, presence: true
end
