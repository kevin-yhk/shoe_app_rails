class ShoesController < ApplicationController
    before_action :present_shoe
    def new 
        @shoe = Shoe.new
    end

    def create
        @shoe = Shoe.create(shoe_params)
        if @shoe.valid?
            redirect_to @shoe
        else
            render :new
        end
    end

    private

    def shoe_params
        params.require(:shoe).permit(:model, :brand)
    end

    def present_shoe
        @shoe = Shoe.find_by(id: params[:id])
    end 
end
