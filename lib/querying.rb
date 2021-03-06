def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books
    WHERE books.series_id = 1
   "
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto FROM characters
   ORDER BY length(characters.motto) DESC
   LIMIT 1
  "
end
  # returns the name and motto of the character with the longest motto (FAILED - 1)

def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species) FROM characters
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1
  "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name ,subgenres.name FROM subgenres
  inner join authors on authors.id = subgenres.id
  "
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
  INNER JOIN characters ON characters.author_id = series.author_id
  WHERE characters.species = 'human'
  LIMIT 1
  "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.id) FROM characters
   INNER JOIN character_books ON character_books.character_id = characters.id
   GROUP BY characters.name
   ORDER BY COUNT(character_books.id) DESC
  "
end


# 1) querying selects all of the character names and their number of books they have appeared in, in descending order
#    Failure/Error: expect(@db.execute(select_character_names_and_number_of_books_they_are_in)).to eq([["Character Three",3], ["Character Two", 3],["Daenerys Targaryen", 3], ["Tyrion Lannister", 3], ["Character Four", 1], ["Character One", 1], ["Eddard Stark", 1], ["Lady", 1]])
