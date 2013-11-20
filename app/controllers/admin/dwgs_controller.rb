class Admin::DwgsController < Admin::BaseController
  include MultilingualController

  before_action :set_dwg, only: [:show, :edit, :update, :destroy]
  before_action :set_good, only: [:new, :edit, :create, :update, :destroy]


  def index
    @dwgs = Dwg.all
  end

  def show
  end

  def new
    @dwg = Dwg.new
    @dwg.good = @good
  end

  def edit
  end

  def create
    @dwg = Dwg.new(dwg_params)
    @dwg.good = @good

    respond_to do |format|
      if @dwg.save
        format.html { redirect_to edit_admin_good_url(@good, anchor: "dwgs"), notice: 'Dwg was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dwg }
      else
        format.html { render action: 'new' }
        format.json { render json: @dwg.errors, status: :unprocessable_entity }
      end
    end
  end

  def order
    errors = []

    if order_params
      order_params.each_with_index do |id, weight|
        item = Dwg.find id
        item.weight = weight

        unless item.save
          errors << item.errors
        end
      end
    end

    respond_to do |format|
      if errors.empty?
        format.json { head :no_content }
      else
        format.json { render json: errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dwg.update(dwg_params)
        format.html { redirect_to edit_admin_good_url(@good, anchor: "dwgs"), notice: 'Dwg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dwg.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @good = @dwg.good

    @dwg.destroy
    respond_to do |format|
      format.html { redirect_to edit_admin_good_url(@good, anchor: "dwgs") }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dwg
    @dwg = Dwg.find(params[:id])
  end

  def set_good
    if @dwg.nil?
      @good = Good.find(params[:good_id] || dwg_params[:good_id])
    else
      @good = @dwg.good
    end
  end

  def safe_params
    [:name, :src, :good_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dwg_params
    permit_params
  end

  def order_params
    params.require(:order)
  end
end
