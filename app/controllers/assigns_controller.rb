class AssignsController < ApplicationController
  before_action :set_assign, only: [:show, :edit, :update, :destroy]

  # GET /assigns
  # GET /assigns.json
  def index
    @assigns = Assign.all.order("created_at DESC")
  end

  # GET /assigns/1
  # GET /assigns/1.json
  def show
  end

  # GET /assigns/new
  def new
    @assign = Assign.new
   
  end

  # GET /assigns/1/edit
  def edit
  end

  # POST /assigns
  # POST /assigns.json
  def create
    @assign = Assign.new(assign_params)

    respond_to do |format|
      if @assign.save
        format.html { redirect_to @assign, notice: 'Atama İşlemi Gerçekleştirildi.' }
        format.json { render :show, status: :created, location: @assign }
      else
        format.html { render :new }
        format.json { render json: @assign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assigns/1
  # PATCH/PUT /assigns/1.json
  def update
    respond_to do |format|
      if @assign.update(assign_params)
        format.html { redirect_to @assign, notice: 'Dünzenleme kayıt edilmiştir.' }
        format.json { render :show, status: :ok, location: @assign }
      else
        format.html { render :edit }
        format.json { render json: @assign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigns/1
  # DELETE /assigns/1.json
  def destroy
    @assign.destroy
    respond_to do |format|
      format.html { redirect_to assigns_url, notice: 'Atama İşlemi silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assign
      @assign = Assign.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assign_params
      params.require(:assign).permit(:video_id, :user_id, :user_confirm, :admin_confirm)
    end
end
