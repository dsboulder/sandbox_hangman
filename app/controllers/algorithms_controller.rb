class AlgorithmsController < ApplicationController
  # GET /algorithms
  # GET /algorithms.xml
  def index
    @algorithms = Algorithm.best_first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @algorithms }
    end
  end

  # GET /algorithms/1
  # GET /algorithms/1.xml
  def show
    @algorithm = Algorithm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @algorithm }
    end
  end

  # GET /algorithms/new
  # GET /algorithms/new.xml
  def new
    @algorithm = Algorithm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @algorithm }
    end
  end

  # GET /algorithms/1/edit
  def edit
    @algorithm = Algorithm.find(params[:id])
  end

  # POST /algorithms
  # POST /algorithms.xml
  def create
    raise "Go away robots" if params[:email].present?
    @algorithm = Algorithm.new(params[:algorithm])
    @algorithm.password = params[:algorithm][:password]
    respond_to do |format|
      if @algorithm.save
        flash[:notice] = 'Algorithm was successfully created.'
        format.html { redirect_to(@algorithm) }
        format.xml  { render :xml => @algorithm, :status => :created, :location => @algorithm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @algorithm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /algorithms/1
  # PUT /algorithms/1.xml
  def update
    raise "Go away robots" if params[:email].present?
    @algorithm = Algorithm.find(params[:id])
    password = params[:algorithm].delete(:current_password)
    respond_to do |format|
      flash.now[:error] = "Incorrect password" if password != @algorithm.password
      if password == @algorithm.password && @algorithm.update_attributes(params[:algorithm])
        flash[:notice] = 'Algorithm was successfully updated.'
        format.html { redirect_to(@algorithm) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @algorithm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /algorithms/1
  # DELETE /algorithms/1.xml
#  def destroy
#    @algorithm = Algorithm.find(params[:id])
#    @algorithm.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(algorithms_url) }
#      format.xml  { head :ok }
#    end
#  end
end
