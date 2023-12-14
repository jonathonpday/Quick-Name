class Content < ApplicationRecord
  belongs_to :display

  validates :title, presence: true
end
