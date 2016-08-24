class Admin::DealOfDaysController < AdminController

  before_action :set_admin_deal_of_day, only: [:show, :edit, :update, :destroy]

  # GET /admin/deal_of_days
  # GET /admin/deal_of_days.json
  def index
    @admin_deal_of_days = Admin::DealOfDay.all
  end

  # GET /admin/deal_of_days/1
  # GET /admin/deal_of_days/1.json
  def show
  end

  # GET /admin/deal_of_days/new
  def new
    @admin_deal_of_day = Admin::DealOfDay.new
  end

  # GET /admin/deal_of_days/1/edit
  def edit
  end

  # POST /admin/deal_of_days
  # POST /admin/deal_of_days.json
  def create
    @admin_deal_of_day = Admin::DealOfDay.new(admin_deal_of_day_params)

    respond_to do |format|
      if @admin_deal_of_day.save
        format.html { redirect_to admin_deal_of_days_url, notice: 'Deal of day was successfully created.' }
        format.json { render :show, status: :created, location: @admin_deal_of_day }
      else
        format.html { render :new }
        format.json { render json: @admin_deal_of_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/deal_of_days/1
  # PATCH/PUT /admin/deal_of_days/1.json
  def update
    respond_to do |format|
      if @admin_deal_of_day.update(admin_deal_of_day_params)
        format.html { redirect_to admin_deal_of_days_url, notice: 'Deal of day was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_deal_of_day }
      else
        format.html { render :edit }
        format.json { render json: @admin_deal_of_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/deal_of_days/1
  # DELETE /admin/deal_of_days/1.json
  def destroy
    @admin_deal_of_day.destroy
    respond_to do |format|
      format.html { redirect_to admin_deal_of_days_url, notice: 'Deal of day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_deal_of_day
      @admin_deal_of_day = Admin::DealOfDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_deal_of_day_params
      params.require(:admin_deal_of_day).permit(:product_id, :expiry_time)
    end
end
