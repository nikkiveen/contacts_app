class Contact < ActiveRecord::Base
  belongs_to :user
  def friendly_updated_at
    updated_at.strftime("%a, %b %e, %Y | %m:%M %p ")
  end

  def full_name
    user_full_name = "#{first_name} #{last_name}"
  end

  def phone_japan
    japan_phone_number = "+81 #{phone_number}"
  end
end
