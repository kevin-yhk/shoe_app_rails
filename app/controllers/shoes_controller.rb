class ShoesController < ApplicationController
    before_action :present_shoe, :logged_in?, :verification
    
    def index
        @shoes = Shoe.ordered_model
    end

    def new 
        @shoe = Shoe.new
    end

    def create
        @shoe = Shoe.create(shoe_params)
        if @shoe.valid?
            flash[:notice] = "A New Shoe Has Been Created"
            redirect_to @shoe
        else
            render :new
        end
    end

    def update
        if @shoe.update(shoe_params)
            @shoe.save
            flash[:notice] = "Shoe Entry Has Been Updated"
            redirect_to @shoe
        else
            render :edit
        end
    end

    def destroy
        present_shoe.destroy
        flash[:notice] = "Shoe Entry Has Been Deleted"
        redirect_to shoes_path
    end

    def show
        @reviews = @shoe.reviews 
    end

    private

    def shoe_params
        params.require(:shoe).permit(:model, :brand)
    end

    def present_shoe
        @shoe = Shoe.find_by(id: params[:id])
    end 
end
