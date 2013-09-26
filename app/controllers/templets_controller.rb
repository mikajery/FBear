class TempletsController < Admin::BaseController

  before_action :set_templet, only: [:show, :edit, :update, :destroy]

  # GET /templets
  # GET /templets.json
  def index
    @templets = Templet.all
  end

  # GET /templets/1
  # GET /templets/1.json
  def show
  end

  # GET /templets/new
  def new
    @templet = Templet.new
  end

  # GET /templets/1/edit
  def edit
  end

  # POST /templets
  # POST /templets.json
  def create
    @templet = Templet.new(templet_params)

    respond_to do |format|
      if @templet.save
        format.html { redirect_to templets_url, notice: 'Templet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @templet }
      else
        format.html { render action: 'new' }
        format.json { render json: @templet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templets/1
  # PATCH/PUT /templets/1.json
  def update
    respond_to do |format|
      if @templet.update(templet_params)
        format.html { redirect_to templets_url, notice: 'Templet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @templet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templets/1
  # DELETE /templets/1.json
  def destroy
    @templet.destroy
    respond_to do |format|
      format.html { redirect_to templets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_templet
      @templet = Templet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templet_params
      params.require(:templet).permit(:name, :src)
    end
end
