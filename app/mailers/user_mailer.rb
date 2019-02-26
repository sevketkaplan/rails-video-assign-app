class UserMailer < ApplicationMailer

def send_new_user_message(user)
	@user=user	
	mail(to: @user.email, subject:"Yeni Kullanıcı Bilgi Mesajı")
end
  def password_reset_instructions(user)
  	@url  = edit_password_reset_url(token: user.password_reset_token)
  	@user=user
  	mail(to: @user.email, subject: "Şifre Sıfırlama")
  end
end
