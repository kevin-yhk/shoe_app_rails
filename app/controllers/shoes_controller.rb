class ShoesController < ApplicationController
    before_action :present_shoe, :logged_in?, :verification
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

    def update
        if @shoe.update(shoe_params)
            @shoe.save
            redirect_to @shoe
        else
            render :edit
        end
    end

    def destroy
        present_shoe.destroy
        redirect_to shoes_path
    end

    private

    def shoe_params
        params.require(:shoe).permit(:model, :brand)
    end

    def present_shoe
        @shoe = Shoe.find_by(id: params[:id])
    end 
end
