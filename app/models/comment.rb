class Comment < ApplicationRecord
  belongs_to :bando
  belongs_to :user
end
