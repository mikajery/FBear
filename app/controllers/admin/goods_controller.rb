class Admin::GoodsController < Admin::BaseController
  include MultilingualController
  
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
    redirect_to edit_admin_good_url
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods
  # POST /goods.json
  def create
    # abort good_params.to_s
    @good = Good.new(good_params)

    respond_to do |format|
      if @good.save
        format.html { redirect_to admin_good_categories_url, notice: 'Good was successfully created.' }
        format.json { render action: 'show', status: :created, location: @good }
      else
        format.html { render action: 'new' }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to admin_good_categories_url, notice: 'Good was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to admin_good_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    def safe_params
      [ 
        :name, :logo, :picture, :slug,
        :width, :depth, :height, :box_depth, :box_width, :box_height, :is_electrical, 
        :announce, :content, :additional, :price,
        :title, :heading, :keywords, :description, 
        :panorama, :vimeo, :thumb,
        :good_category_ids => [], :designer_ids => [], :material_ids => [], :tag_ids => []
      ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      permit_params
    end
end
