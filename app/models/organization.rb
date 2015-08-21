class Organization < ActiveRecord::Base
  has_many :events
    validates :name, presence: true, uniqueness: true
end

# User.create!(name: 'foo')
# user = User.first
# user = User.find(1)
# user = User.find_by_name('foo')
# event = Event.create!(user: user, organization: Organization.first, start_date: 1.hour.ago, end_date: 2.hours.ago, location: 'foobar')

#Event.create!(title: 'Square Code Camp', organization: Organization.first, user: User.first, start_time: 2.hours.ago, end_time: 1.hour.ago, location: 'San Francisco', description: 'this is really fun')
