class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        @company.user_id = current_user.id
        current_user.email = (company_params)[:email]
        current_user.password = (company_params)[:password]
        current_user.role = params[:role].to_i
        current_user.image = (company_params)[:profile_image]
        current_user.first_name = (company_params)[:company_name]
        current_user.save
        @company.save
        sign_in(current_user, :bypass => true)
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        current_user.email = (company_params)[:email]
        current_user.password = (company_params)[:password] if (company_params)[:password]
        current_user.image = (company_params)[:profile_image]
        current_user.first_name = (company_params)[:first_name]+" "+(company_params)[:last_name]
        current_user.save
        sign_in(current_user, :bypass => true)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:company_name, :first_name, :last_name, :school_name, :address1, :address2, :business_area, :person_title, :industry_type, :dept_size, :country, :city, :zip_code, :about, :image1, :image2, :image3, :profile_image, :email, :password)
    end
end
