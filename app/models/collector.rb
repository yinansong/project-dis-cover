class Collector < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :manholecovers, dependent: :destroy
  belongs_to :role

  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Viewer" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  has_attached_file :avatar,
    :styles => {:thumb => '50x50>', :medium => '200x200>'},
    :default_url => ':style/missing.jpg',
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => S3_CREDENTIALS

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes

  validates :email, email_format: { message: "This doesn't look like an email address. Please try again."}
end
