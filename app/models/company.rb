class Company < ActiveRecord::Base
	include Elasticsearch::Model 
    include Elasticsearch::Model::Callbacks
	belongs_to :user
	mount_uploader :image1, CompanyImageUploader
	mount_uploader :image2, CompanyImageUploader
	mount_uploader :image3, CompanyImageUploader
	mount_uploader :profile_image, CompanyImageUploader
  after_save :reindex_users
  before_destroy :reindex_users
  
  def reindex_users
    if self.changed?
      self.__elasticsearch__.index_document
      # self.user.__elasticsearch__.index_document
       #self.jobbers.__elasticsearch__.index_document
     
    end
  end



def self.paypal_url(return_url)
  values = {
    :business => 'arvindyuvasoft112-facilitator@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => 1323
      }
    values.merge!({
      "amount_1" => 12,
      "item_name_1" => 'test product',
      "item_number_1" => 132,
      "quantity_1" => 132
    })
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end


end
# Company.import 
