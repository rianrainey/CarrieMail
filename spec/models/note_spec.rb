require 'spec_helper'

describe Note do
  it 'should validate catalog' do
    pending "need to run this test #{__FILE__}"
  end
end












# == Schema Information
#
# Table name: notes
#
#  id                    :integer         not null, primary key
#  catalog_id            :integer         not null
#  body                  :text
#  created_at            :datetime
#  updated_at            :datetime
#  status                :integer
#  letter_file_name      :string(255)
#  letter_content_type   :string(255)
#  letter_file_size      :integer
#  document_content      :text
#  return_name           :string(255)
#  return_street         :string(255)
#  return_addr_line2     :string(255)
#  return_city           :string(255)
#  return_state          :string(255)
#  return_zip            :string(255)
#  dest_name             :string(255)
#  dest_street           :string(255)
#  dest_addr_line2       :string(255)
#  dest_city             :string(255)
#  dest_state            :string(255)
#  dest_zip              :string(255)
#  envelope_file_name    :string(255)
#  envelope_content_type :string(255)
#  envelope_file_size    :integer
#  envelope_content      :text
#  purchased_at          :datetime
#  full_price            :decimal(, )
#  cart_id               :integer
#

