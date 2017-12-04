class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :attendees
  has_many :registrees
  has_many :events, :through => :registrees
  has_many :occurrences, :through => :attendees

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def find_attendee(occurrence)
    attendee = Attendee.where("user_id = ? AND occurrence_id = ?",self.id,occurrence.id).first
    return attendee
  end
end
