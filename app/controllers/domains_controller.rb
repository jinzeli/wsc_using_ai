class DomainsController < ApplicationController
  before_filter :correct_user, :only => [:destroy]
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

  def update
   @domain = Domain.find(params[:id])
    if correct_user?(current_user)
      if @domain.update_attributes(params[:domain])
        redirect_to @domain, :notice  => "Successfully updated domain."
      else
        render :action => 'edit'
      end
    else
      if @domain.pproblem? && (params[:domain][:pproblem_delete] == "1")
        @domain.update_attributes(:pproblem_delete => params[:domain][:pproblem_delete])
        redirect_to @domain, :notice  => "Successfully updated problem file."
      elsif !@domain.pproblem?
        @domain.update_attributes(:pproblem => params[:domain][:pproblem])
        redirect_to @domain, :notice  => "Successfully uploaded problem file."
      else
        redirect_to @domain, :notice  => "Not authorized to edit this part of domain"
      end
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
    
    #Apply MBP to planning jobs
    #@plan = %x[MBP-solve -plan_output - #{@dpath} #{@ppath}]
    
    #Apply SGPLan5 to planning jobs
    %x[sgplan522 -o #{@dpath} -f #{@ppath} -out ~/output]
    
    @plan = File.open(ENV['HOME']+'/output', 'r').read
    if @domain.update_attribute(:plan, @plan)
      
    else
      redirect_to @domain, :notice  => "Plan cannot be saved."
    end
  end

end
