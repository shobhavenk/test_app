class SecretCode < ActiveRecord::Base
  # import "activerecord-import"
  attr_accessible :code, :user_id
  belongs_to :user
end
