class Event < ActiveRecord::Base
  belongs_to :organization
  has_and_belongs_to_many :users
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
