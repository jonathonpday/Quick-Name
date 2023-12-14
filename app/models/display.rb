class Display < ApplicationRecord
  belongs_to :user

  has_many :content
  accepts_nested_attributes_for :content, allow_destroy: true
end
