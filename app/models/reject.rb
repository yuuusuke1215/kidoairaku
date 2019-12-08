class Reject < ApplicationRecord
  belongs_to :user
  belongs_to :reject, class_name: 'User'
end
