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
#  id                  :integer         not null, primary key
#  catalog_id          :integer         not null
#  title               :string(255)
#  body                :text
#  recipient_id        :integer         not null
#  created_at          :datetime
#  updated_at          :datetime
#  status              :integer
#  pdfdoc_file_name    :string(255)
#  pdfdoc_content_type :string(255)
#  pdfdoc_file_size    :integer
#  document_content    :text
#  greeting            :string(255)
#  closing             :string(255)
#  greeting_name       :string(255)
#  signature           :string(255)
#

