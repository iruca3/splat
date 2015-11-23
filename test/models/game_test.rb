# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  board       :text
#  turn        :text
#  turn_number :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
