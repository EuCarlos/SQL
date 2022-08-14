# Let's use SQLite and the sqlite3 gem
require "sqlite3"

# Connecting to the database
db = SQLite3::Database.new "harry_potter_movies.sqlite"

# Create a table
rows = db.execute <<-SQL
    CREATE TABLE 'harry_potter_movies' (
        'movie_id' int PRIMARY KEY NOT NULL,
        'movie_title' varchar(20) NOT NULL CHECK ('movie_title' <> ''),
        'release_year' varchar(255) NOT NULL CHECK ('release_year' <> ''),
        'runtime' varchar(255) NOT NULL CHECK ('runtime' <> ''),
        'budget' varchar(255) NOT NULL CHECK ('budget' <> ''),
        'box_office' varchar(255) NOT NULL CHECK ('box_office' <> '')
    );
SQL

array_with_datas = [
    [1, "Harry Potter and the Philosopher's Stone", 2001, 152, "$125,000,000", "$1,002,000,000"],
    [2, "Harry Potter and the Chamber of Secrets", 2002, 161, "$100,000,000", "$880,300,000"],
    [3, "Harry Potter and the Prisoner of Azkaban", 2004, 142, "$130,000,000", "$796,700,000"],
    [4, "Harry Potter and the Goblet of Fire", 2005, 157, "$150,000,000", "$896,400,000"],
    [5, "Harry Potter and the Order of the Phoenix", 2007, 138, "$150,000,000", "$942,000,000"],
    [6, "Harry Potter and the Half-Blood Prince", 2009, 153, "$250,000,000", "$943,200,000"],
    [7, "Harry Potter and the Deathly Hallows Part 1", 2010, 146, "$200,000,000", "$976,900,000"],
    [8, "Harry Potter and the Deathly Hallows Part 2", 2011, 130, "$250,000,000", "$1,342,000,000"]
]

# Adding my records
array_with_datas.each do |datas|
  db.execute "INSERT INTO harry_potter_movies VALUES (?, ?, ?, ?, ?, ?)", datas
end

p "| id | titulo | ano de lançamento |"

db.execute("SELECT movie_id, movie_title, release_year FROM harry_potter_movies") do |row|
    p "| #{row[0]} | #{row[1]} | #{row[2]} |"
end
