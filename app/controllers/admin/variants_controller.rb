class Admin::VariantsController < Admin::BaseController
  include MultilingualController

  before_action :set_variant, only: [:show, :edit, :update, :destroy]
  before_action :set_good, only: [:new, :edit, :create, :update, :destroy]

  # GET /variants
  # GET /variants.json
  def index
    @variants = Variant.all
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
  end

  # GET /variants/new
  def new
    @variant = Variant.new
    @variant.good = @good
  end

  # GET /variants/1/edit
  def edit
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = Variant.new(variant_params)
    @variant.good = @good

    respond_to do |format|
      if @variant.save
        format.html { redirect_to edit_admin_good_url(@variant.good, anchor: "variants"), notice: 'Variant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @variant }
      else
        format.html { render action: 'new' }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1
  # PATCH/PUT /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html { redirect_to edit_admin_good_url(@variant.good, anchor: "variants"), notice: 'Variant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @variant.destroy
    respond_to do |format|
      format.html { redirect_to edit_admin_good_url(@variant.good, anchor: "variants") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    def set_good
      if @variant.nil?
        @good = Good.find(params[:good_id] || variant_params[:good_id])
      else
        @good = @variant.good
      end
    end

    def safe_params
      [
          :good_id, 
          :price,
          :name
      ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variant_params
      property_types = {}
      params[:variant][:property_types].permit!.each{|k, p| property_types[k] = p[:property_ids]}

      params = permit_params
      params[:property_types] = property_types
      params
    end
end
