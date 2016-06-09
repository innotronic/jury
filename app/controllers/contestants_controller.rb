class ContestantsController < ApplicationController

  before_action :set_contestant, only: [:show, :edit, :update, :destroy]
  
  
  # GET /contestants
  # GET /contestants.json
  def index
    @contestants = Contestant.all.order( :number )
  end

  # GET /contestants/1
  # GET /contestants/1.json
  def show
  end

  # GET /contestants/new
  def new
    @contestant = Contestant.new
  end

  # GET /contestants/1/edit
  def edit
  end

  # POST /contestants
  # POST /contestants.json
  def create
    @contestant = Contestant.new(contestant_params)

    respond_to do |format|
      if @contestant.save
        format.html { redirect_to @contestant, notice: 'Contestant was successfully created.' }
        format.json { render :show, status: :created, location: @contestant }
      else
        format.html { render :new }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contestants/1
  # PATCH/PUT /contestants/1.json
  def update
    respond_to do |format|
      if @contestant.update(contestant_params)
        format.html { redirect_to @contestant, notice: 'Contestant was successfully updated.' }
        format.json { render :show, status: :ok, location: @contestant }
      else
        format.html { render :edit }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestants/1
  # DELETE /contestants/1.json
  def destroy
    @contestant.destroy
    respond_to do |format|
      format.html { redirect_to contestants_url, notice: 'Contestant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contestant
      @contestant = Contestant.where( "id = ? OR number = ?", params[ :id ], params[ :id ] ).take || not_found
    end

    def contestant_params
      params.require( :contestant ).permit( :name, :number, :categorie_id )
    end
end
