class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :com_name
      t.string :com_logo_name
      t.string :com_email
      t.string :com_address
      t.string :com_web_url
      t.string :com_phone_number
      t.string :com_fax_number
      t.text :com_description
      t.string :com_logo_image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
