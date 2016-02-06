class MixesController < ApplicationController

  before_filter :set_mix, except: [:index, :new, :create]
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :json, only: [:sort, :add_track]

  # GET /mixes
  # GET /mixes.json
  def index
    @mixes = Mix.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mixes }
    end
  end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
    @tracks = @mix.tracks

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mix }
    end
  end

  # GET /mixes/new
  # GET /mixes/new.json
  def new
    @mix = Mix.new

    @mix.tracks.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mix }
    end
  end

  # GET /mixes/1/edit
  def edit
  end

  # POST /mixes
  # POST /mixes.json
  def create
    @mix = Mix.new(params[:mix])

    respond_to do |format|
      if @mix.save
        current_user.mixes << @mix
        format.html { redirect_to @mix, notice: 'Mix was successfully created.' }
        format.json { render json: @mix, status: :created, location: @mix }
      else
        format.html { render action: "new" }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mixes/1
  # PUT /mixes/1.json
  def update
    respond_to do |format|
      if @mix.update_attributes(params[:mix])
        format.html { redirect_to @mix, notice: 'Mix was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixes/1
  # DELETE /mixes/1.json
  def destroy
    @mix.destroy

    respond_to do |format|
      format.html { redirect_to mixes_url }
      format.json { head :no_content }
    end
  end
  
  def sort
    @mix.tracks.each do |track|
      track.position = params[:mix].index(track.id.to_s) + 1
      track.save
    end
    render :nothing => true
  end

private

  def set_mix
    @mix = Mix.find(params[:id])
  end

  def mix_params
    params.require(:mix).permit(
      :id,
      :title, 
      :description,
      :user_id,
      :art,
      tracks_attributes: [
        :id, 
        :name, 
        :artist, 
        :mix_id, 
        :audio, 
        :position, 
        :_destroy
      ]
    )
  end

end
