# this model will create instance of All users of system
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :recoverable, :rememberable,
         :trackable, :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_many :addresses, as: :addressable
<<<<<<< a7b42d6ae85d8299c6a30395d640ce0caecd699e
  before_create :assign_default_role
=======
  has_many :favourites
>>>>>>> #70 Add food_item to Favourite.

  def self.find_for_google_oauth2(acc_token, _signed_in_resource = nil)
    data = acc_token.info
    user = User.where(provider: acc_token.provider, uid: acc_token.uid).first
    if user
      return user
    else
      registered_user = User.where(email: acc_token.info.email).first
      if registered_user
        return registered_user
      else
        User.create(username: data['username'],
                    provider: acc_token.provider,
                    email:    data['email'],
                    uid:      acc_token.uid,
                    password: Devise.friendly_token[0, 20])
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data']) && (data['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.username # assuming the user model has a name
    end
  end

  private
    def assign_default_role
      add_role(:customer) #if self.roles.blank?
    end
end
