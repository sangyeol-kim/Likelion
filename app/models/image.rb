class Image < ApplicationRecord
  mount_uploader :file, FileUploader
end