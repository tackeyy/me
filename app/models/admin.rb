# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  name                            :string(255)      not null
#  email                           :string(255)      not null
#  type                            :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  remember_me_token               :string(255)
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  remember_me_token_expires_at    :datetime
#  created_at                      :datetime
#  updated_at                      :datetime
#

class Admin < User
end
