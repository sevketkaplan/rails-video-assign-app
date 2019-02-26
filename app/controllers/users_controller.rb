class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :authorize_admin, only: :create
	before_action :set_user, only: [:edit,:update]

	def show
		@user = User.friendly.find(params[:id])
		@assigns=Assign.where(user_id: @user.id).order("created_at DESC")
	end

	def index
		@users=User.all.order("created_at DESC")

	end

	
	def new 
		@user=User.new
	end

	def create
		@user=User.new(user_params)
		@user.password_mail=@user.password
		if current_user.admin?
			UserMailer.send_new_user_message(@user).deliver_now
			if @user.save
				flash[:notice]="Kullanıcı hesabı oluşturuldu. !!"
				redirect_to users_path
			end
		else
			flash[:notice]="Kullanıcı hesabını sadece yönetici oluşturabilir."
			redirect_to new_user_path

		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to users_path, notice: 'Kullanıcı Güncellendi!' }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	

	private
	def set_user
		@user=User.friendly.find(params[:id])
	end
	def authorize_admin
		return unless !current_user.admin?
		redirect_to new_user_path, alert: 'Admins only!'
	end
	def user_params
		params.require(:user).permit(:password_mail,:thumbnail,:name_surname, :email, :password, :password_confirmation)
	end
end