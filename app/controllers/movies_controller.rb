class MoviesController < ApplicationController
  def index
	@movie = Movie.search_for(params[:q])
	@movietwo = Movie.find_by_year_released('1994')  
	@moviethree = Movie.where("year_released='1994'") 
	@moviefour = Movie.where("title LIKE '%God%'") 
  end

  def new
  	@movie = Movie.new
  end	

  def show
  	@movie = Movie.find(params[:id])
  end


  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		redirect_to @movie
  	else
  		render 'new'
  	end		
  end	


  def edit
       @movie = Movie.find(params[:id])
  end


  def update
    @movie = Movie.find(params[:id])
    @movie.update movie_params
    redirect_to @movie
  end   

  def destroy
    @movie.destroy
    #respond_to do |format|
     # format.html { redirect_to movies_url }
      #format.json { head :no_content }
    end

  private
    def movie_params
      params.require('movie').permit(:title, :description, :year_released)
    end

end

#@movie = Movie.search_for(params[:q])