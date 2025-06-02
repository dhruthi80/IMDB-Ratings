create database project_movie_database;
use project_movie_database;
-- 1. Retrieve all columns from the Movies table.
select*from movies;
-- 2. Select only movie names and their release dates.
select original_title,release_date from movies;
-- 3. List all distinct departments in the Directors table.
select distinct(department) from directors;
-- 4. Count how many movies are in the dataset.
select count(*) from movies;
-- 5. Filter movies with revenue greater than 100 million.
SELECT * FROM movies WHERE Revenue > 100000000;
-- 6.Which director made the most movies?
select d.name,count(m.original_title) as max_movies from directors as d join movies m on d.id = m.director_id group by d.name
order by max_movies desc limit 1; 
-- 7.  Find all female directors.
select*from directors where gender = 1; 
-- 8.. Find movies with a vote average above 5.
select original_title,vote_average from movies where vote_average >5;
-- 9. Sort movies by popularity in descending order.
select original_title,popularity from movies order by popularity desc;
-- 10. Write an SQL query to fetch each movie’s title along with the corresponding director’s name by joining the Movies and Directors tables.
select m.title,d.name from movies as m join directors as d on d.id = m.director_id;
-- 11. Count how many movies each director has made.
select d.name,count(m.id) as movie_count from directors as d join movies m on d.id = m.director_id group by d.name ;
-- 12. Write an SQL query to calculate the average movie budget for each director.
select round(avg(m.budget)),d.name from directors as d join movies m on d.id = m.director_id group by d.name;
-- 13. Find the movie with the highest revenue.
select original_title,revenue from movies order by revenue desc limit 1;
-- 14. Get total revenue by year.
select year(release_date) as year,sum(revenue) as total_revenue from movies group by 
year order by total_revenue;
-- 15. Get top 5 directors by total revenue.
select d.name,sum(m.revenue) as total_revenue from directors as d join movies m on d.id = m.director_id group by
 d.name order by total_revenue limit 5;
-- 16. Find directors who directed more than 2 movies.
select d.name,count(m.id) as movie_count from directors as d join movies m  on d.id = m.director_id  group by d.name having 
movie_count>2;
-- 17. Find the second highest revenue movie.
select original_title,revenue from movies order by revenue desc limit 1  offset 1;
-- 18. Classify movies based on revenue: High (>500M), Medium (100M–500M), Low (<100M). Show movie title and revenue category.
select original_title, revenue,case when revenue>500000000 then "High" when revenue between 100000000 AND 500000000
 then 'Medium' else "Low" end as revenue_category from movies;
 -- 19. Find all original titile  starting with S.
select original_title  from movies where original_title  like "%S";
-- 20 Find the name of the 10th first women directors?
select name from directors where gender = 1 order by id limit 1 offset 9;
-- 21 Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select*from directors where name = "James Cameron" or name = "Luc Besson" or name = "John Woo"; 
-- 22. Which movie(s) were directed by Brenda Chapman?
select d.name,m.original_title from directors as d join movies m on  d.id = m.director_id where d.name = "Brenda Chapman";