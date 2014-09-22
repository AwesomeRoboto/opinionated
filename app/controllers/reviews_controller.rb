class ReviewsController < ApplicationController
  def index
	@reviews = Review.all
  end

  def show 
  @review = Review.find(params[:id]) 
  @reviews = Review.all
  end

  def index
    @review = Review.new
    @reviews = Review.all
  end


  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(params.require(:review).permit(:name, :email, :rating, :restaurant, :comment))
  	if @review.save
  		redirect_to new_review_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	@review = Review.find(params[:id])
  	if @review.update_attributes(params.require(:review).permit(:name, :email, :rating, :restaurant))
  		redirect_to index_path
  	else
  		render 'edit'
  	end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end
  

end