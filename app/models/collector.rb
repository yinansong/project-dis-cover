class Collector < ActiveRecord::Base
  has_many :manholecovers, dependent: :destroy

  has_attached_file :avatar,
    :styles => {:thumb => '50x50>', :medium => '200x200>'},
    :default_url => ':style/missing.jpg',
    # The :url is the url that users will use to render the image.
    :url => ':s3_domain_url',
    # The :path is the directory in your application where your files will be stored.
    :path => '/:class/:id_partition/:style/:filename',
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => S3_CREDENTIALS

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes

  validates :email, email_format: { message: "This doesn't look like an email address. Please try again."}
end
