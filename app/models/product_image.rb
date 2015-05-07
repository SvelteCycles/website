class ProductImage < ActiveRecord::Base

  belongs_to :product
  belongs_to :inventory

  has_attached_file :photo,
    storage: :s3,
    s3_credentials: {
      bucket: 'sveltewebsite',
      access_key_id: Rails.application.secrets.s3_access_key,
      secret_access_key: Rails.application.secrets.s3_secret_key
    }

  do_not_validate_attachment_file_type :photo

end
