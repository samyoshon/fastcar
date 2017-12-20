class ProposalsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  
  # GET /proposals
  # GET /proposals.json
  def index
    # @makes = HTTParty.get('https://jsonplaceholder.typicode.com', :headers => {'Content-Type' => 'application/json'})
    # @makes.to_json
    if current_user.present? && current_user.dealership_id?
      @proposals = Proposal.where("make = ?", current_user.dealership.make)
      @q = Proposal.where("make = ?", current_user.dealership.make).search(params[:q])
    elsif current_user.present?
      @proposals = Proposal.where("user_id = ?", current_user.id)
      @responses = Response.all
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = current_user.proposals.build(proposal_params)

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reviews
    @review = Review.new
    @seller = User.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:user_id, :purchase_type_id, :car_quality_type_id, :car_year_id, :car_make_id, :car_model_id, :car_color_id, :add_ons, :price, :over_under_price, :down_payment, :lease_length, :mileage_limit, :closing_cost, :financing, :apr, :deadline)
    end
end
