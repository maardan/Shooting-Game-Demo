class GameroomsController < ApplicationController
  before_action :set_gameroom, only: [:update, :destroy]
  before_filter :authenticate_user!
  respond_to :html, :js

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
        # Pusher['private-'+params[:gameroom][:after_id]].trigger('new_gameroom', {:from => @gameroom.user_id})
        # @gameroom = render_to_string( :partial => '/gamerooms/gameroom', :locals => { :gameroom => gameroom} )
        # render :json => { :success => true, :html => @gameroom }
        # Pusher['new_gameroom'].trigger($Q{$("#gamerooms_refresh").html("<%= escape_javascript(render :partial => '/gameroom', :gamerooms => @gamerooms) %>");})
        Pusher.trigger('test_channel', 'new_gameroom', @gameroom, { socket_id: params[:socket_id] })
        format.js
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