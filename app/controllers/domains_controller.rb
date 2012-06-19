class DomainsController < ApplicationController
  # before_filter :authenticate, :only => [:create, :new, :destroy, :edit, :update]
  # before_filter :correct_user, :only => [:edit, :update, :destroy]
  before_filter :authenticate, :only => [:create, :new, :destroy]

  def index
    @domains = Domain.all
  end

  def show
    @domain = Domain.find(params[:id])
  end

  def new
    @domain = Domain.new
  end

  def create
    #@domain = Domain.new(params[:domain])
    @domain = current_user.domains.build(params[:domain])
    if @domain.save
      redirect_to @domain, :notice => "Successfully created domain."
    else
      render :action => 'index'
    end
  end

  def edit
    @domain = Domain.find(params[:id])
  end

  # def update
    # @domain = Domain.find(params[:id])
    # if @domain.update_attributes(params[:domain])
      # redirect_to @domain, :notice  => "Successfully updated domain."
    # else
      # render :action => 'edit'
    # end
  # end
  def update
   @domain = Domain.find(params[:id])
    if correct_user?(current_user)
      if @domain.update_attributes(params[:domain])
        redirect_to @domain, :notice  => "Successfully updated domain."
      else
        render :action => 'edit'
      end
    else
      @domain.update_attributes(:pproblem_delete => params[:domain][:pproblem_delete]) if @domain.pproblem?
      @domain.update_attributes(:pproblem => params[:domain][:pproblem]) if !@domain.pproblem?

      redirect_to @domain, :notice  => "Successfully updated problem file."     
    end
  end

  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy
    redirect_to domains_url, :notice => "Successfully destroyed domain."
  end
  
  def plan
    @domain = Domain.find(params[:id])
    @dpath = @domain.pdomain.path
    @ppath = @domain.pproblem.path
    #@plan = %x[MBP-solve -plan_output - #{@dpath} #{@ppath}]
    @plan = %x[sgplan522 -o #{@dpath} -f #{@ppath}]
    if @domain.update_attribute(:plan, @plan)
      
    else
      redirect_to @domain, :notice  => "Plan cannot be saved."
    end
  end
end
