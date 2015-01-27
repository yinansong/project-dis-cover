class Manholecover < ActiveRecord::Base
  belongs_to :collector

  has_attached_file :manhole_img,
    :styles => {:small => '320x320>', :large => '640x640>'},
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => S3_CREDENTIALS

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :manhole_img, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :manhole_img, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :manhole_img, :less_than => 2.megabytes
end
