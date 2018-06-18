class ReviewsController < ApplicationController

    before_filter :authorize

    def create
        review = Review.new(review_params)
        review.user_id = session[:user_id]
        review.product_id = params[:product_id]
        if review.valid?
          review.save
        end
        redirect_to product_path(params[:product_id])
    end

    def destroy
        review = Review.find params[:id]
        review.destroy!
        redirect_to product_path(params[:product_id])
    end
    
    private
        def review_params
          params.require(:review).permit(:rating, :description)
        end
end
