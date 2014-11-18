class Task < ActiveRecord::Base
  belongs_to :user

  validates :user, :name, :description, presence: true
end
