require 'spec_helper'

describe Recipient do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: recipients
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  note_id    :integer
#  first_name :string(255)
#  last_name  :string(255)
#  street     :string(255)
#  addr_line2 :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

