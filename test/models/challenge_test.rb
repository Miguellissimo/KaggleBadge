require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  def setup
    @c = Challenge.new(team_name: 'Example', link: "https://www.kaggle.com/c/titanic", image: "base64_image", name: 'Example name', user_id: 1)
  end

  test "challenge name is not blank" do
    @c.name = "   "
    assert_not @c.valid?
  end
  
  test "challenge should be valid" do
    assert @c.valid?
  end

  test "challenge name should not be too long" do
    @c.name = "a" * 256
    assert_not @c.valid?
  end

  test "only one challenge with same name per team" do
    duplicate_challenge = @c.dup
    @c.save
    assert_not duplicate_challenge.valid?
  end

  test "is there someone with a user id value of team_id" do
  end

  test "is challenge name a valid link to the competition" do
  end
end

