class User < ActiveRecord::Base
  scope :active,  -> { where(status: 'Active') }
  scope :buyers,  -> { where(type: 'Buyer') }
  scope :sellers, -> { where(type: 'Seller') }

  inheritance_column = :type

  has_attached_file :avatar, styles: { medium: '200x', thumb: '100x' }
  validates_attachment :avatar, content_type: { content_type: %w[image/jpeg image/gif image/png] }, size: { in: 0..5.megabytes }
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, uniqueness: { case_sensitive: false }

  validates_presence_of :first_name
  after_initialize :set_reference

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_reference
    self.reference ||= "#{DateTime.now.to_i}#{SecureRandom.hex(4)}"
  end

  def view_type
    type.downcase.pluralize
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
