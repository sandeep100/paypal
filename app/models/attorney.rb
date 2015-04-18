require 'elasticsearch/model'
class Attorney < ActiveRecord::Base
  include Elasticsearch::Model 
  include Elasticsearch::Model::Callbacks 
	belongs_to :user
	mount_uploader :image_1, AttorneyImageUploader
	mount_uploader :image_2, AttorneyImageUploader
	mount_uploader :image_3, AttorneyImageUploader
	mount_uploader :profile_image, AttorneyImageUploader
  after_save :reindex_users
  before_destroy :reindex_users
  validates_presence_of :first_name
# 	def self.search(q)
#   __elasticsearch__.search(
#     {      
#         query: { query_string: {
#          query: "first_name:\"#{q}\" OR last_name:\"#{q}\"  OR email:\"#{q}\""
#       }}

  
#   }
#   )
# end
def reindex_users
  if self.changed?
    self.__elasticsearch__.index_document
    # self.user.__elasticsearch__.index_document
     #self.jobbers.__elasticsearch__.index_document
     
  end
end
end
# Attorney.import 
