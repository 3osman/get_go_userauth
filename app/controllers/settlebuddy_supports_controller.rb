class SettlebuddySupportsController < ApplicationController
  before_action :set_settlebuddy_support, only: [:show, :edit, :update, :destroy]

  # GET /settlebuddy_supports
  # GET /settlebuddy_supports.json
  def index
    @settlebuddy_supports = SettlebuddySupport.all
  end

  # GET /settlebuddy_supports/1
  # GET /settlebuddy_supports/1.json
  def show
  end

  # GET /settlebuddy_supports/new
  def new
    @settlebuddy_support = SettlebuddySupport.new
  end

  # GET /settlebuddy_supports/1/edit
  def edit
  end

  # POST /settlebuddy_supports
  # POST /settlebuddy_supports.json
  def create
    @settlebuddy_support = SettlebuddySupport.new(settlebuddy_support_params)

    respond_to do |format|
      if @settlebuddy_support.save
        format.html { redirect_to @settlebuddy_support, notice: 'Settlebuddy support was successfully created.' }
        format.json { render :show, status: :created, location: @settlebuddy_support }
      else
        format.html { render :new }
        format.json { render json: @settlebuddy_support.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settlebuddy_supports/1
  # PATCH/PUT /settlebuddy_supports/1.json
  def update
    respond_to do |format|
      if @settlebuddy_support.update(settlebuddy_support_params)
        format.html { redirect_to "/users/edit", notice: 'Settlebuddy settings were successfully updated.' }
        format.json { render :show, status: :ok, location: @settlebuddy_support }
      else
        format.html { render :edit }
        format.json { render json: @settlebuddy_support.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settlebuddy_supports/1
  # DELETE /settlebuddy_supports/1.json
  def destroy
    @settlebuddy_support.destroy
    respond_to do |format|
      format.html { redirect_to settlebuddy_supports_url, notice: 'Settlebuddy support was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_settlebuddy_support
      @settlebuddy_support = SettlebuddySupport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def settlebuddy_support_params
      params.require(:settlebuddy_support).permit(:bank, :visa, :housing, :public_transport, :caf, :telecommunication, :user_id)
    end
end
