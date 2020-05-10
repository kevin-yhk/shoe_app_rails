class ShoesController < ApplicationController

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
end
