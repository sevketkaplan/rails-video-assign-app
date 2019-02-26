class User < ApplicationRecord
	extend FriendlyId
	friendly_id :name_surname, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :thumbnail
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  after_create :send_admin_mail
  def deliver_password_reset_instructions
  	self.password_reset_token = SecureRandom.hex(4)
  	save(validate: false)

  	UserMailer.password_reset_instructions(self).deliver_now
  end
  def login
    @login || self.email
  end

  def soft_delete  
    update_attribute(:is_deleted, true)  
  end  
  
  # ensure user account is active  
  def active_for_authentication?  
    super && !is_deleted  
  end  
  
  # provide a custom message for a deleted account   
  def inactive_message   
    !is_deleted ? super : :deleted_account  
  end 

  def send_admin_mail
    UserMailer.send_new_user_message(self).deliver
  end 
end
