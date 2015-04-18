class AttorneysController < ApplicationController
  before_action :set_attorney, only: [:show, :edit, :update, :destroy]

  # GET /attorneys
  # GET /attorneys.json
  def index
    @attorneys = Attorney.all
  end

  # GET /attorneys/1
  # GET /attorneys/1.json
  def show
  end

  # GET /attorneys/new
  def new
    @attorney = Attorney.new
  end

  # GET /attorneys/1/edit
  def edit
  end

  # POST /attorneys
  # POST /attorneys.json
  def create
    @attorney = Attorney.new(attorney_params)
    respond_to do |format|
      if @attorney.save
        @attorney.user_id = current_user.id
        current_user.email = (attorney_params)[:email]
        current_user.password = (attorney_params)[:password]
        current_user.role = params[:role].to_i
        current_user.image = (attorney_params)[:profile_image]
        current_user.first_name = (attorney_params)[:first_name]+" "+(attorney_params)[:middle_name]+" "+(attorney_params)[:last_name]
        current_user.save
        @attorney.save
        sign_in(current_user, :bypass => true)
        format.html { redirect_to attorneys_path, notice: 'Attorney was successfully created.' }
        format.json { render :show, status: :created, location: @attorney }
      else
        format.html { render :new }
        format.json { render json: @attorney.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attorneys/1
  # PATCH/PUT /attorneys/1.json
  def update
    respond_to do |format|
      if @attorney.update(attorney_params)
        current_user.email = (attorney_params)[:email]
        current_user.password = (attorney_params)[:password] if (attorney_params)[:password]
        current_user.image = (attorney_params)[:profile_image]
        current_user.first_name = (attorney_params)[:first_name]+" "+(attorney_params)[:middle_name]+" "+(attorney_params)[:last_name]
        current_user.save
        sign_in(current_user, :bypass => true)
        format.html { redirect_to @attorney, notice: 'Attorney was successfully updated.' }
        format.json { render :show, status: :ok, location: @attorney }
      else
        format.html { render :edit }
        format.json { render json: @attorney.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attorneys/1
  # DELETE /attorneys/1.json
  def destroy
    @attorney.destroy
    respond_to do |format|
      format.html { redirect_to attorneys_url, notice: 'Attorney was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def search  
    #@attorneys = Attorney.__elasticsearch__.search(params[:search]).records
    if current_user.role == 1
      @attorneys = Company.__elasticsearch__.search(query: {match: {_all: {query: params[:search], fuzziness: 3}}}).records  
    else
      @attorneys = Attorney.__elasticsearch__.search(query: {match: {_all: {query: params[:search], fuzziness: 3}}}).records 
      # @attorneys = (@attorneys << @companies).flatten
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attorney
      if current_user.role != 1
        @attorney = Attorney.find(params[:id])
      else
        @attorney = Company.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attorney_params
      params.require(:attorney).permit(:first_name, :middle_name, :last_name, :email, :address1, :address2, :country, :city, :zip_code, :school_name, :greduate_year, :jurisdiction, :altematives, :expert, :support, :gender, :about, :image_1, :image_2, :image_3, :profile_image, :password)
    end
end
