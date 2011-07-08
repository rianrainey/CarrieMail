require 'spec_helper'

describe Note do
  pending "add some examples to (or delete) #{__FILE__}"
end




# == Schema Information
#
# Table name: notes
#
#  id                  :integer         not null, primary key
#  catalog_id          :integer
#  title               :string(255)
#  body                :text
#  recipient_id        :integer
#  created_at          :datetime
#  updated_at          :datetime
#  status              :integer
#  pdfdoc_file_name    :string(255)
#  pdfdoc_content_type :string(255)
#  pdfdoc_file_size    :integer
#  document_content    :text
#

