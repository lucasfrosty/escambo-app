class Ad < ApplicationRecord
	monetize :price_cents, :allow_nil => false,
  :numericality => {
    :greater_than => 0
  }

  belongs_to :category
  belongs_to :member



  validates :title, :description, :picture, :category, :finish_date, presence: true

  has_attached_file :picture, 
  									styles: { medium: "320x150#", thumb: "100x100>" },
  									default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :finding_member, ->(member) { where(member: member) }
end
