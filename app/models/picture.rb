class Picture < ActiveRecord::Base
  belongs_to :advertisement


  has_attached_file :image,
    dependent: :destroy,
    styles: { large: "600x600>", thumb: "200x200#", small_thumb: "80x80#" },
    url: "/assets/images/:style/:basename.:extension",
    path: ":rails_root/public/assets/images/:style/:basename.:extension"


validates_attachment :image, content_type: { content_type: [ "image/jpg", "image/jpeg", "image/png" ] }

  # do_not_validate_attachment_file_type :image
end
