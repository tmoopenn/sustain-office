class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :attendees
  has_many :registrees
  has_many :events, :through => :registrees
  has_many :occurrences, :through => :attendees

  has_attached_file :image, :styles=> {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "no_photo.png"
  validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}



  scope :rank1, lambda { User.all.where('tpoints >= ?', 14).order("tpoints").reverse_order}
  scope :rank2, lambda { where('tpoints >= ? AND tpoints < ?', 10, 14).order("tpoints").reverse_order}
  scope :rank3, lambda { where('tpoints >= ? AND tpoints < ?', 6, 10).order("tpoints").reverse_order}

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
