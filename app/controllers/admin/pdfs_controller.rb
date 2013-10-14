class Admin::PdfsController < Admin::BaseController
  include MultilingualController

  before_action :set_pdf, only: [:show, :edit, :update, :destroy]
  before_action :set_good, only: [:new, :edit, :create, :update, :destroy]
  

  # GET /pdfs
  # GET /pdfs.json
  def index
    @pdfs = Pdf.all
  end

  # GET /pdfs/1
  # GET /pdfs/1.json
  def show
  end

  # GET /pdfs/new
  def new
    @pdf = Pdf.new
    @pdf.good = @good
  end

  # GET /pdfs/1/edit
  def edit
  end

  # POST /pdfs
  # POST /pdfs.json
  def create
    @pdf = Pdf.new(pdf_params)
    @pdf.good = @good

    respond_to do |format|
      if @pdf.save
        format.html { redirect_to edit_admin_good_url(@good, anchor: "pdfs"), notice: 'Pdf was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pdf }
      else
        format.html { render action: 'new' }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  def order
    errors = []

    if order_params
      order_params.each_with_index do |id, weight|
        item = Pdf.find id
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

  # PATCH/PUT /pdfs/1
  # PATCH/PUT /pdfs/1.json
  def update
    respond_to do |format|
      if @pdf.update(pdf_params)
        format.html { redirect_to edit_admin_good_url(@good, anchor: "pdfs"), notice: 'Pdf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdfs/1
  # DELETE /pdfs/1.json
  def destroy
    @good = @pdf.good
    
    @pdf.destroy
    respond_to do |format|
      format.html { redirect_to edit_admin_good_url(@good, anchor: "pdfs") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf
      @pdf = Pdf.find(params[:id])
    end

    def set_good
      if @pdf.nil?
        @good = Good.find(params[:good_id] || pdf_params[:good_id])
      else
        @good = @pdf.good
      end
    end

    def safe_params
      [:name, :src, :good_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_params
      permit_params
    end

    def order_params
      params.require(:order)
    end
end
