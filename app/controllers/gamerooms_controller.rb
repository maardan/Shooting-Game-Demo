class GameroomsController < ApplicationController
  before_action :set_gameroom, only: [:destroy]
  respond_to :js

  # GET /gamerooms
  # GET /gamerooms.json
  def index
    @gamerooms = gamerooms.where('id > ?', params[:after_id].to_i).order('created_at DESC')
  end

  # GET /gamerooms/new
  def new
    @gamerooms = Gameroom.order('created_at DESC')
  end

  # GET /gamerooms/1
  # GET /gamerooms/1.json
  # def show
  # end

  # GET /gamerooms/1/edit
  # def edit
  # end

  # POST /gamerooms
  # POST /gamerooms.json
  def create
    @gameroom = Gameroom.new(gameroom_params)
    @gameroom.user_id = current_user.id

    respond_to do |format|
      if @gameroom.save
        format.js
        # Pusher.trigger('gamerooms_channel', 'new_gameroom', { gameroomID: @gameroom.id })
      else
        flash.now[:error] = 'Your gameroom has error.'    
      end
    end 
  end

# PATCH/PUT /gamerooms/1
# PATCH/PUT /gamerooms/1.json
  # def update
  # end

  # DELETE /gamerooms/1
  # DELETE /gamerooms/1.json
  def destroy
    @gameroom.destroy
    Pusher.trigger('gamerooms_channel', 'delete_gameroom', { gameroomID: @gameroom.id })
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
end