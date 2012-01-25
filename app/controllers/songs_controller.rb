class SongsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_user
  after_filter  :calc_scores, :only => :update

  def index
    @letters = ("A".."Z").to_a
    @search = Song.search do
      fulltext params[:search]
    end

    if params[:letter]
      @songs = Song.by_letter(params[:letter])
    else
      @songs = @search.results
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end


  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  #def new
  #  @song = Song.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @song }
  #  end
  #end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  #def create
  #  @song = Song.new(params[:song])
  #
  #  respond_to do |format|
  #    if @song.save
  #      format.html { redirect_to @song, notice: 'Song was successfully created.' }
  #      format.json { render json: @song, status: :created, location: @song }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @song.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  #def destroy
  #  @song = Song.find(params[:id])
  #  @song.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to songs_url }
  #    format.json { head :ok }
  #  end
  #end

  def h100_list
    @songs = Song.h100_list
    #@songs = Song.first
    #render 'layouts/h100_list'

  end
  private
  def find_user
    @user = current_user
    #@user = User.first
  end

  def calc_scores
    #after update, check if anyone picked this song
    #and update their total score with the value for this song

  end

end
