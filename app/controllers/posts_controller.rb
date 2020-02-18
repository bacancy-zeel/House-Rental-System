class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = House.all
        
    end

    def show
    end

    def new
        @post = House.new
    end

    def edit
    end

    def create
      @house = House.new(stu_params)
      @house.user = current_user
      respond_to do |format|

          if @house.save
             format.html { redirect_to @house, notice: 'Request is sent to Admin' }

          else
              
              format.html { render :new }
          end

      end
    end

    def update
    end

    def destroy
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:category, :house_type, :square_feet, :amount, :reserved, :approved, :user_id, images: [])
    end
end