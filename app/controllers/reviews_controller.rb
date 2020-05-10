class ReviewsController < ApplicationController
    before_action :current_user, :current_shoe
    def new 
        if params[:shoe_id]
            @shoe = Shoe.find_by(id: params[:shoe_id])
            @review = @shoe.reviews.new(user_id: @user.id)
        end
    end

    def create
        @review = @shoe.reviews.create(review_params)
        if @review.valid? 
            @shoe = @review.shoe
            redirect_to shoe_review_path(@shoe, @review)
        else
            render :new
        end
    end

    def show 
        @review = @shoe.reviews.find_by(id: params[:id])
    end 

    private
    
    def review_params
        params.require(:review).permit(:title, :review, :user_id)
    end

    def current_shoe
        @shoe = Shoe.find_by(id: params[:shoe_id])
    end 
end
