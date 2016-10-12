class User < ActiveRecord::Base
  authenticates_with_sorcery!

  acts_as_taggable

  has_many :posts
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
