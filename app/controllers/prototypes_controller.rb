class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to prototype_path
    else
      render :new
    end
  end

    def show
      @comment = Comment.new
      @prototype = Prototype.find(params[:id]) 
      @comments = @prototype.comments
      
   
    end

   def edit
    
   end
   
   def update
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to prototypes_path
    else
      render :edit
    end
   end 

   def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
   end 
  
  

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end