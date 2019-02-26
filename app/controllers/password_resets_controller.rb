class PasswordResetsController < ApplicationController
	def new
		
	end

	def create
		@user = User.where(email: params[:email]).first

		if @user
			UserMailer.password_reset_instructions(@user).deliver_now
			flash[:notice] = "Şifre sıfırlama linki mail adresinize gönderilmiştir."

			redirect_to root_path
		else
			flash.now[:error] = " #{params[:email]} mailine ait kullanıcı bulunamamıştır."
			render :new
		end
	end

	def edit
		load_user_using_perishable_token
		@token = @user.password_reset_token
	end
	def update
		load_user_using_perishable_token
		@user.password = params[:password]

		if @user.save
			flash[:success] = "Your password was successfully updated"
			redirect_to root_path
		else
			render :edit
		end
	end

	private

	def load_user_using_perishable_token
		@user = User.where(password_reset_token: params[:token]).first
		unless @user
			flash[:error] = "Bu maile ait hesap bulunamadı."
			redirect_to root_url
		end
	end

end
