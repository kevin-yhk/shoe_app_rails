class ReviewsController < ApplicationController

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
end
