class Admin::TestimonialsController < AdminController
  before_action :set_admin_testimonial, only: [:show, :edit, :update, :destroy]

  # GET /admin/testimonials
  # GET /admin/testimonials.json
  def index
    @admin_testimonials = Admin::Testimonial.all
  end

  # GET /admin/testimonials/1
  # GET /admin/testimonials/1.json
  def show
  end

  # GET /admin/testimonials/new
  def new
    @admin_testimonial = Admin::Testimonial.new
    @admin_testimonial.build_image
  end

  # GET /admin/testimonials/1/edit
  def edit
    unless @admin_testimonial.image.present?
       @admin_testimonial.build_image
     end
    
  end

  # POST /admin/testimonials
  # POST /admin/testimonials.json
  def create
    @admin_testimonial = Admin::Testimonial.new(admin_testimonial_params)

    respond_to do |format|
      if @admin_testimonial.save
        format.html { redirect_to @admin_testimonial, notice: 'Testimonial was successfully created.' }
        format.json { render :show, status: :created, location: @admin_testimonial }
      else
        format.html { render :new }
        format.json { render json: @admin_testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/testimonials/1
  # PATCH/PUT /admin/testimonials/1.json
  def update
    respond_to do |format|
      if @admin_testimonial.update(admin_testimonial_params)
        format.html { redirect_to admin_testimonials_url, notice: 'Testimonial was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_testimonial }
      else
        format.html { render :edit }
        format.json { render json: @admin_testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/testimonials/1
  # DELETE /admin/testimonials/1.json
  def destroy
    @admin_testimonial.destroy
    respond_to do |format|
      format.html { redirect_to admin_testimonials_url, notice: 'Testimonial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_testimonial
      @admin_testimonial = Admin::Testimonial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_testimonial_params
      params.require(:admin_testimonial).permit(:name, :description, image_attributes: [:name, :avatar])
  end
end
