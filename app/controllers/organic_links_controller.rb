class OrganicLinksController < ApplicationController
  before_action :set_organic_link, only: [:show, :edit, :update, :destroy]

  # GET /organic_links
  # GET /organic_links.json
  def index
    @organic_links = OrganicLink.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /organic_links/1
  # GET /organic_links/1.json
  def show
  end

  # GET /organic_links/new
  def new
    @organic_link = OrganicLink.new
  end

  # GET /organic_links/1/edit
  def edit
  end

  # POST /organic_links
  # POST /organic_links.json
  def create
    @organic_link = OrganicLink.new(organic_link_params)

    respond_to do |format|
      if @organic_link.save
        format.html { redirect_to @organic_link, notice: 'Organic link was successfully created.' }
        format.json { render :show, status: :created, location: @organic_link }
      else
        format.html { render :new }
        format.json { render json: @organic_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organic_links/1
  # PATCH/PUT /organic_links/1.json
  def update
    respond_to do |format|
      if @organic_link.update(organic_link_params)
        format.html { redirect_to @organic_link, notice: 'Organic link was successfully updated.' }
        format.json { render :show, status: :ok, location: @organic_link }
      else
        format.html { render :edit }
        format.json { render json: @organic_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organic_links/1
  # DELETE /organic_links/1.json
  def destroy
    @organic_link.destroy
    respond_to do |format|
      format.html { redirect_to organic_links_url, notice: 'Organic link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organic_link
      @organic_link = OrganicLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organic_link_params
      params.require(:organic_link).permit(:name, :link, :search, :options)
    end
end
