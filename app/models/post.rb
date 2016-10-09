class Post < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: { wip: 0, done: 1 }

  belongs_to :user
end
