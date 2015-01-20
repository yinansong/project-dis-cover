class Collector < ActiveRecord::Base
  has_many :manholecovers, dependent: :destroy

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar,
    :styles => { :thumb => '50x50>', :medium => '200x200>'},
    :default_url => ":style/missing.jpg",
    :storage => :s3,
    :url => ':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename',
    :bucket => "dis-cover",
    :s3_credentials => S3_CREDENTIALS

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
end
