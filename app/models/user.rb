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

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts
  has_many :tags, through: :posts
  has_many :categories

  accepts_nested_attributes_for :tags,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :categories,
                                reject_if: :all_blank,
                                allow_destroy: true

  validates :password,
            length: { minimum: 8 },
            confirmation: true,
            if: :new_record_or_changes_password

  validates :password_confirmation,
            presence: true,
            if: :new_record_or_changes_password

  validates :email, uniqueness: true

  private

  def new_record_or_changes_password
    new_record? || changes[:crypted_password]
  end
end
