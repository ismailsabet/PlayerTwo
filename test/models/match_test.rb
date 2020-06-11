require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "invalid match" do
    match = Match.new
    match.user_1 = nil
    match.user_2 = nil
    match.user_1_approves = nil
    match.user_2_approves = nil
    assert match.invalid?
  end

  test "valid match" do
  match = Match.new
  match.user_1 = 2
  match.user_2 = 4
  match.user_1_approves = true
  match.user_2_approves = true
  assert match.valid?
  end
end
