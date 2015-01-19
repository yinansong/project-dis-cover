class Collector < ActiveRecord::Base
  has_many :manholecovers

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar,
    :styles => { :thumb => '50x50>', :medium => '200x200>'},
    :storage => :s3,
    :url => ':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename',
    :bucket => "project-dis-cover",
    :s3_credentials => S3_CREDENTIALS

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
