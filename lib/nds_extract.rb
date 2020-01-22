# Provided, don't edit
# require 'directors_database'

require_relative './directors_database'
require 'pp'

# pp directors_database


# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# pp movie_with_director_name("Russo Brothers", directors_database[1][:movies][0])

# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  
  # RETURN:
  
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  a_o_h_movies_with_director = []
  
  i = 0
  while i < movies_collection.length do
    movie = movies_collection[i]
    movie_with_director_name = movie_with_director_name(name, movie)
    
    a_o_h_movies_with_director << movie_with_director_name
    
    i += 1
  end
  
  return a_o_h_movies_with_director
end

# pp movies_with_director_key("Russo Brothers", [{:title=>"Avengers Endgame",
#     :studio=>"Buena Vista",
#     :worldwide_gross=>858371337,
#     :release_year=>2019},
#     {:title=>"Avengers Infinity War",
#     :studio=>"Buena Vista",
#     :worldwide_gross=>678815482,
#     :release_year=>2018},
#     {:title=>"Captain America Civil War",
#     :studio=>"Buena Vista",
#     :worldwide_gross=>408084349,
#     :release_year=>2016},
#     {:title=>"Captain America The Winter Soldier",
#     :studio=>"Buena Vista",
#     :worldwide_gross=>259766572,
#     :release_year=>2014},
#     {:title=>"You, Me and Dupree",
#     :studio=>"Universal",
#     :worldwide_gross=>75628110,
#     :release_year=>2006},
#     {:title=>"Welcome to Collinwood",
#     :studio=>"Warner Brothers",
#     :worldwide_gross=>336620,
#     :release_year=>2002}])

def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  studios_with_gross = {}
  
  i = 0
  while i < collection.length do
    gross = collection[i][:worldwide_gross]
    studio = collection[i][:studio]
    
    if !studios_with_gross[studio]
      studios_with_gross[studio] = gross
    elsif studios_with_gross[studio]
      studios_with_gross[studio] += gross
    end
    
    i += 1
  end
  
  return studios_with_gross
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  array_of_movies_with_directors = []
  
  i = 0
  while i < source.length do
    director_name = source[i][:name]
    movies = source[i][:movies]
    # pp movies
    
    array_of_movies_with_directors << movies_with_director_key(director_name, movies)
    
    # j = 0
    # while j < movies.length do
    #   inner_array = []
    #   movie = movies[j]
    #   # pp movie
      
    #   inner_array << movie_with_director_name(director_name, movie)
    #   array_of_movies_with_directors << inner_array
      
    #   # array_of_movies_with_directors << movie_with_director_name(director_name, movie)
      
    #   j += 1
    # end
    
    i += 1
  end
  
  return array_of_movies_with_directors
end

# pp movies_with_directors_set(directors_database)
# pp gross_per_studio(flatten_a_o_a(movies_with_directors_set(directors_database)))

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end

# pp flatten_a_o_a(movies_with_directors_set(directors_database))