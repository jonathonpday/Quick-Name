class Display < ApplicationRecord
  belongs_to :user

  has_many :content, dependent: :destroy
  accepts_nested_attributes_for :content, allow_destroy: true
end
