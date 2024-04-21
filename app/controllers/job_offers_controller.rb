class JobOffersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @offers = JobOffer.all
    else
      @offers = JobOffer.where(publish: "true")
    end
  end

  def show; end

  def new
    @offer = JobOffer.new
  end

  def create
    @offer = JobOffer.new(offer_params)
    if @offer.save!
      redirect_to job_offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @offer.update!(offer_params)
      redirect_to job_offer_path(@offer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @offer.destroy
      redirect_to job_offers_path
    else
      render :show, status: :see_other
    end
  end

  private

  def set_offer
    @offer = JobOffer.find(params[:id])
  end

  def offer_params
    params.require(:job_offer).permit(:titre, :job_description, :geolocalisation, :job_type, :starting_date, :salary, :candidate_profil, :publish)
  end
end
