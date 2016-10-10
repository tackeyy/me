class Post < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: { wip: 0, published: 1 }

  belongs_to :user
end
