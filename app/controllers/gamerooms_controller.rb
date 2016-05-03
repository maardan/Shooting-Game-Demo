class GameroomsController < ApplicationController
  before_action :set_gameroom, only: [:update, :destroy]
  respond_to :html, :js

    # List of events
  # LOBBIES_UPDATED_EVENT = "lobbies_updated_event"
  # GAME_ROOM_UPDATED_EVENT = "game_room_updated_event"
  # GAME_STARTED_EVENT = "game_started_event"

  # GET /gamerooms
  # GET /gamerooms.json
  def index
    @gamerooms = gamerooms.where('id > ?', params[:after_id].to_i).order('created_at DESC')
  end

  # GET /gamerooms/new
  def new
    @gameroom = Gameroom.new(gameroom_params)
    @gamerooms = Gameroom.order('created_at DESC')
  end

  # GET /gamerooms/1
  # GET /gamerooms/1.json
  def show
  end

  # GET /gamerooms/1/edit
  def edit
  end

  # POST /gamerooms
  # POST /gamerooms.json
  def create
    @gameroom = Gameroom.new(gameroom_params)
    @gameroom.user_id = current_user.id

    respond_to do |format|
      if @gameroom.save
        # broadcast(GAME_LOBBIES_PUBLIC_CHANNEL, LOBBIES_UPDATED_EVENT, {})
        format.html { redirect_to @gamerooms }
        format.json { render json: @gamerooms, status: :created, location: @gameroom }
        format.js 
      else
        format.html { render :nothing }
        format.json { render json: @gameroom.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @gameroom.update(gameroom_params)
  end

  # DELETE /gamerooms/1
  # DELETE /gamerooms/1.json
  def destroy
    @gameroom = Gameroom.find(params[:id])
    @gameroom.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js
    end
    # broadcast(GAME_LOBBIES_PUBLIC_CHANNEL, LOBBIES_UPDATED_EVENT, {})
  end

  public
    # Use callbacks to share common setup or constraints between actions.
    def set_gameroom
      @gameroom = Gameroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameroom_params
      params.fetch(:gameroom, {})
    end

    # def broadcast(channels, event, data)
    #   # Include the socket ID because we want to exclude the sender as the recipient
    #   Pusher.trigger(channels, event, data, { socket_id: params[:socket_id] });
    # end
end