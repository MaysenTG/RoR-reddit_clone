class AddSloganAndDescToCommunities < ActiveRecord::Migration[7.0]
  def change
    add_column :communities, :slogan, :text
    add_column :communities, :description, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
