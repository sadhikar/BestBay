class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml { head :ok }
    end
  end

  def register
    @user = User.new
    @event = params[:commit]
    @check = params[:accept]
    if (@event == "Cancel")
      redirect_to root_path
    end

    if (@event == "Register" && @check.nil?)
      redirect_to root_path
    end
    if (@event == "Register" && @check != nil)
      redirect_to seller_reg_path
    end
  end

  def seller_reg
    @event = params[:commit]
    if (@event == "Submit")
      redirect_to myaccounts_path
    end
  end

  def search

  end

  def itempage
    @event = params[:commit]
    if (@event == "Bid")
      redirect_to bidding_path
    end
  end

  def login
    @user = User.new
    @event = params[:commit]
    if (@event == "Cancel")
      redirect_to root_path
    end
    if (@event == "Login")
      redirect_to myaccounts_path
    end
  end

  def myaccounts
    @event = params[:commit]
    if (@event == "Become a Seller")
      redirect_to seller_reg_path
    end
  else
    if (@event == "Sell Item")
      redirect_to sellitem_path
    end
  end

  def sellitem
    @event = params[:commit]
    if (@event == "Sell")
      redirect_to itempage_path
    end
  else
    if (@event == "Cancel")
      redirect_to myaccounts_path
    end
  end

  def bid
    @event = params[:commit]
    if (@event == "Submit Bid")
      redirect_to itempage_path
    end
  else
    if (@event == "Cancel")
      redirect_to itempage_path
    end
  end

end
