class MoviesController < ApplicationController
  helper_method :sort_column

  def index
    set_ratings
    @movies = Movie.where(:rating => @ratings.select{|k, v| @ratings[k] == true}.keys)
                   .order(sort_column)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private

  def set_ratings

    @ratings = {
      "G" => true,
      "PG" => true,
      "PG-13" => true,
      "R" => true
    }
    unless params[:ratings]
      ratings = session[:ratings]
    else
      ratings = params[:ratings]
      session[:ratings] = params[:ratings]
    end
    unless ratings.nil?
      @ratings.map{|k, v| @ratings[k] = false}
      ratings.each do |rating|
        @ratings[rating] = true
      end
    end
  end

  def sort_column
    if params[:sort_by]
      sort_by = params[:sort_by]
      session[:sort_by] = sort_by
    else
      sort_by = session[:sort_by]
    end
    Movie.column_names.include?(sort_by) ? sort_by : nil
  end
end
