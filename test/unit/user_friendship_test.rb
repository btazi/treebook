require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
should belong_to(:user)
should belong_to(:friend)

test "creating a friendship works without raising an exception" do
	assert_nothing_raised do
	UserFriendship.create user: users(:jason), friend: users(:bob)
	end	
end

test "that creating a friendship based on user id and friend id works" do
		UserFriendship.create user_id: users(:jason).id, friend_id: users(:bob).id
		assert users(:jason).friends.include?(users(:bob))
end

end
