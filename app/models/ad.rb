class Ad < ApplicationRecord
  # Constants
  ADS_PER_PAGE = 6

  # Ratyrate GEM
  ratyrate_rateable "quality"

  # Callbacks
  before_save :markdown_to_html

  # Monetize
	monetize :price_cents, :allow_nil => false,
  :numericality => {
    :greater_than => 0
  }

  # Associations
  belongs_to :category, counter_cache: true
  belongs_to :member
  has_many :comments


  # Validations
  validates :title, :description_md, :description_short, :picture, :category, :finish_date, presence: true

  has_attached_file :picture, 
  									styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" },
  									default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Scopes
  scope :paginate_by_category, ->(type, page) { where(category: type).page(page).per(ADS_PER_PAGE) }
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(ADS_PER_PAGE) }
  scope :finding_member, ->(member) { where(member: member) }
  scope :search, ->(q, page) { where("title LIKE ?", "%#{q}%").page(page).per(ADS_PER_PAGE) }

  # Functions
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
