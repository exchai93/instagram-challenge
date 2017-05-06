class Photo < ApplicationRecord
  upload_photo :photo, PhotoUploader

end
