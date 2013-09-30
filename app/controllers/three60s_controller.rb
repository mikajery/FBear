class Three60sController < Admin::BaseController
  before_action :set_three60, only: [:show, :edit, :update, :destroy]
  before_action :set_good, only: [:new, :edit, :create, :update, :destroy]

  # GET /three60s
  # GET /three60s.json
  def index
    @three60s = Three60.all
  end

  # GET /three60s/1
  # GET /three60s/1.json
  def show
  end

  # GET /three60s/new
  def new
    @three60 = Three60.new
    @three60.good = @good
  end

  # GET /three60s/1/edit
  def edit
  end

  # POST /three60s
  # POST /three60s.json
  def create
    params = three60_params
    zip = params.slice("zip")[:zip]

    params.select!{|k, v| k != 'zip'}

    @three60 = Three60.new(params)
    @three60.good = @good

    @three60.unpack(zip)

    respond_to do |format|
      if @three60.save
        format.html { redirect_to edit_good_url(@good), notice: 'Three60 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @three60 }
      else
        format.html { render action: 'new' }
        format.json { render json: @three60.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /three60s/1
  # PATCH/PUT /three60s/1.json
  def update
    respond_to do |format|
      if @three60.update(three60_params)
        format.html { redirect_to edit_good_url(@good), notice: 'Three60 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @three60.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /three60s/1
  # DELETE /three60s/1.json
  def destroy
    @three60.destroy
    respond_to do |format|
      format.html { redirect_to edit_good_url(@good) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_three60
      @three60 = Three60.find(params[:id])
    end

    def set_good
      if @three60.nil?
        @good = Good.find(params[:good_id] || three60_params[:good_id])
      else
        @good = @three60.good
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def three60_params
      params.require(:three60).permit(:name, :src, :zip, :good_id)
    end    
end
