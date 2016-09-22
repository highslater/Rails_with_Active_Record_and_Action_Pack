class User < ActiveRecord::Base
  has_one :profile, dependent: :delete
end
