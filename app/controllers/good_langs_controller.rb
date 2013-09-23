class GoodLangsController < Admin::BaseController
  before_action :set_good_lang, only: [:show, :edit, :update, :destroy]

  # GET /good_langs
  # GET /good_langs.json
  def index
    @good_langs = GoodLang.all
  end

  # GET /good_langs/1
  # GET /good_langs/1.json
  def show
  end

  # GET /good_langs/new
  def new
    @good_lang = GoodLang.new
    @good_lang.language = Language.find(params[:lang_id])
    @good_lang.good = Good.find(params[:good_id])
  end

  # GET /good_langs/1/edit
  def edit
  end

  # POST /good_langs
  # POST /good_langs.json
  def create
    @good_lang = GoodLang.new(good_lang_params)

    respond_to do |format|
      if @good_lang.save
        format.html { redirect_to edit_good_url(good_lang_params[:good_id]), notice: 'Good lang was successfully created.' }
        format.json { render action: 'show', status: :created, location: @good_lang }
      else
        format.html { render action: 'new' }
        format.json { render json: @good_lang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /good_langs/1
  # PATCH/PUT /good_langs/1.json
  def update
    respond_to do |format|
      if @good_lang.update(good_lang_params)
        format.html { redirect_to edit_good_url(good_lang_params[:good_id]), notice: 'Good lang was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @good_lang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /good_langs/1
  # DELETE /good_langs/1.json
  def destroy
    @good_lang.destroy
    respond_to do |format|
      format.html { redirect_to good_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good_lang
      @good_lang = GoodLang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_lang_params
      params.require(:good_lang).permit(:language_id, :good_id, :name, :slug, :logo, :price, :description, :meta_title, :meta_keywords, :meta_description)
    end
end
