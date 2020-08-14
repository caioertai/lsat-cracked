class Chapter < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :sections, dependent: :destroy
end