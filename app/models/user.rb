class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
              :omniauthable,  :omniauth_providers => [:facebook]
  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates :city_of_studies, presence: true
  validates :duration, presence: true
  validates :birthdate, presence: true
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"] if user.name.blank?
        user.provider = "facebook" if user.provider.blank?
        user.uid = data["id"] if user.uid.blank?

      end
    end
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
    user
    else # Create a user with a stub password.
      user =User.new
    user
    end
  end
  has_one :roadmap
  has_one :settlebuddy_support
end
