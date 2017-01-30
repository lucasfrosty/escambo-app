class Ad < ApplicationRecord
  # Callbacks
  before_save :markdown_to_html

  # Monetize
	monetize :price_cents, :allow_nil => false,
  :numericality => {
    :greater_than => 0
  }

  belongs_to :category, counter_cache: true
  belongs_to :member



  validates :title, :description_md, :description_short, :picture, :category, :finish_date, presence: true

  has_attached_file :picture, 
  									styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" },
  									default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :finding_member, ->(member) { where(member: member) }

  private

  def markdown_to_html
    options = {
      filter_html: true,
      link_attributes: {
        rel: "nofollow",
        target: "_blank"
      }
    }

    extensions = {
      space_after_headers: true,
      autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md).html_safe
  end
end
