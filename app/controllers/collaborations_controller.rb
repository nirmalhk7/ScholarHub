class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /collaborations
  # GET /collaborations.json
  def index
    (@filterrific = initialize_filterrific(
      Collaboration,
      params[:filterrific]
    )) || return
    @collaborations_count = Collaboration.count
    @scholar_count = Collaboration.pluck(:user_id).uniq.count
    @fields_covered = Collaboration.pluck(:fields).flatten.uniq.count
    @collaborations = @filterrific.find.page(params[:page]).includes(:user)
  end

  # GET /collaborations/1
  # GET /collaborations/1.json
  def show
  end

  # GET /collaborations/new
  def new
    @collaboration = Collaboration.new
  end

  # GET /collaborations/1/edit
  def edit
  end

  # POST /collaborations
  # POST /collaborations.json
  def create
    creation_params = collaboration_params
    creation_params[:fields] = serialize_to_array(collaboration_params[:fields])
    creation_params[:user] = current_user
    @collaboration = Collaboration.new(creation_params)

    respond_to do |format|
      if @collaboration.save
        format.html { redirect_to @collaboration, notice: 'Collaboration was successfully created.' }
        format.json { render :show, status: :created, location: @collaboration }
      else
        format.html { render :new }
        format.json { render json: @collaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborations/1
  # PATCH/PUT /collaborations/1.json
  def update
    respond_to do |format|
      if @collaboration.update(collaboration_params)
        format.html { redirect_to @collaboration, notice: 'Collaboration was successfully updated.' }
        format.json { render :show, status: :ok, location: @collaboration }
      else
        format.html { render :edit }
        format.json { render json: @collaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborations/1
  # DELETE /collaborations/1.json
  def destroy
    @collaboration.destroy
    respond_to do |format|
      format.html { redirect_to collaborations_url, notice: 'Collaboration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaboration
      @collaboration = Collaboration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collaboration_params
      params.require(:collaboration).permit(:user_id, :title, :description, :fields)
    end
end
