class DocUploader < CarrierWave::Uploader::Base
  storage :fog                    # <- and this
end
