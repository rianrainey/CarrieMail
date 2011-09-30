require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: transactions
#
#  id            :integer         not null, primary key
#  order_id      :integer
#  action        :string(255)
#  amount        :integer
#  success       :boolean
#  authorization :string(255)
#  message       :string(255)
#  params        :text
#  created_at    :datetime
#  updated_at    :datetime
#

