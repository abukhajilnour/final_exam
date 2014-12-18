class User < ActiveRecord::Base
    has_secure_password
    has_many :auctions


  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze.strip
    else
      email
    end
  end

  private

  def capitalize_first_name
    self.first_name.capitalize! if first_name
  end
end
