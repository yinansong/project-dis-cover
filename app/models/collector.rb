class Collector < ActiveRecord::Base
  has_many :manholecovers

  # This method associates the attribute ":avatar" with a file attachment
  has_attach_file :avatar, styles: {
    thumb: '50x50>',
    circle: '200x200>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
