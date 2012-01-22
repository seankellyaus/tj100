class SelectionsController < ApplicationController
  # GET /selections
  # GET /selections.json
  before_filter :authenticate_user!

  before_filter :find_user

  def index
    @selections = @user.selections

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selections }
    end
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
    @selection = Selection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection }
    end
  end

  # GET /selections/new
  # GET /selections/new.json
  def new
    #@selection = Selection.new
    #selection = Selection.new(params[:selection][:user])
    #@selection = Selection.new(:song_id => params[:song_id], :user_id => params[:user_id])
    #@selection = Selection.new!(:song => @song, :user => @user)

    params = { :selection => { :song => @song, :user => @user } }
    @selection = Selection.create(params[:selection])


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection }
    end
  end

  # GET /selections/1/edit
  def edit
    @selection = Selection.find(params[:id])
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(params[:selection])
    #@selection = Selection.new(params[:selection].merge!(:user => current_user))
    #@selection = Selection.new(:song_id => params[:song_id], :user_id => params[:user_id])
    #@selection = Selection.create!(:song => @song, :user => @user)
    #@selection = Selection.new(:song => @song, :user => @user)

    #params = { :selection => { :song => @song, :user => @user } }
    #@selection = Selection.create(params[:selection])


    respond_to do |format|
      if @selection.save
        format.html { redirect_to @selection, notice: 'Selection was successfully created.' }
        format.json { render json: @selection, status: :created, location: @selection }
      else
        format.html { render action: "new" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selections/1
  # PUT /selections/1.json
  def update
    @selection = Selection.find(params[:id])

    respond_to do |format|
      if @selection.update_attributes(params[:selection])
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection = Selection.find(params[:id])
    @selection.destroy

    respond_to do |format|
      format.html { redirect_to selections_url }
      format.json { head :ok }
    end
  end

  private
  def find_user
    @user = current_user
    #@user = User.first
  end
end
