class GuestUser < ApplicationRecord
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |guest_user|
      guest_user.password = SecureRandom.urlsafe_base64
    end
  end

end
