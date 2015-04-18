class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :authentications, dependent: :destroy
  has_one :company, dependent: :destroy
  has_one :attorney, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  mount_uploader :image, ProfileImageUploader
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid).first
    if authentication
      authentication.update_attributes(provider:auth.provider, uid:auth.uid, token:auth.credentials.token, expired_at:Time.at(auth.credentials.expires_at), social_image:auth.info.image )
      return authentication.user
    else
      user = User.create_user(auth)
      authentication = user.authentications.new(provider:auth.provider, uid:auth.uid, token:auth.credentials.token, expired_at:Time.at(auth.credentials.expires_at), social_image:auth.info.image )
      authentication.save
      return user
    end
  end

  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid).first
    if authentication
      authentication.update_attributes(provider:auth.provider, uid:auth.uid, token:auth.credentials.token, expired_at:auth.credentials.expires_at, social_image:auth.info.image )
      return authentication.user
    else
      user = User.create_user(auth)
      authentication = user.authentications.new(provider:auth.provider, uid:auth.uid, token:auth.credentials.token, expired_at:auth.credentials.expires_at, social_image:auth.info.image )
      authentication.save
      return user
    end
  end

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid).first    
    if authentication
      authentication.update_attributes(provider:auth.provider, uid:auth.uid, token:auth.credentials.token, expired_at:Time.at(auth.credentials.expires_at), social_image:auth.info.image )
      return authentication.user
    else
      user = User.create_user(auth)
      authentication = user.authentications.new(provider:auth.provider, uid:auth.uid, token:auth.credentials.token, expired_at:Time.at(auth.credentials.expires_at), social_image:auth.info.image )
      authentication.save
      return user
    end
  end 

  def User.create_user(auth)
    user = User.find_by_email(auth.info.email)
      if user.blank?      
      user = User.create(email:auth.info.email, first_name:auth.info.name,
            password:Devise.friendly_token[0,20])
    end
    return user
  end

end
