-- Exploratory Data Analysis

select *
from layoffs_staging2;


select max(total_laid_off)
from layoffs_staging2;


select *
from layoffs_staging2
where total_laid_off=(
select max(total_laid_off)
from layoffs_staging2);


select *
from layoffs_staging2
order by total_laid_off desc
limit 6;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off=(
select max(percentage_laid_off)
from layoffs_staging2);
-- or
select *
from layoffs_staging2
where percentage_laid_off=1;



select *
from layoffs_staging2
where percentage_laid_off=1
order by total_laid_off desc;

select *
from layoffs_staging2
where percentage_laid_off=1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;


select min(`date`),max(`date`)
from layoffs_staging2;

select year(`date`) as Year,
sum(total_laid_off) as total_laid_off
from layoffs_staging2
group by year(`date`)
order by Year;


select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;


select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 1;

SELECT MONTH(`date`) AS `month`,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY MONTH(`date`)
ORDER BY total_laid_off desc;

-- or

SELECT substring(`date`,6,2) AS `month`,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY `MONTH`
ORDER BY total_laid_off desc;

SELECT DATE_FORMAT(`date`, '%Y-%m') AS `month`,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY DATE_FORMAT(`date`, '%Y-%m')
ORDER BY `month`;

-- or

SELECT substring(`date`,1,7) AS `month`,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY `MONTH`
order by 1 asc;


SELECT substring(`date`,1,7) AS `month`,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
where substring(`date`,1,7) is not null
GROUP BY `MONTH`
order by 1;


with rolling_total as
(
SELECT substring(`date`,1,7) AS `month`,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
where substring(`date`,1,7) is not null
GROUP BY `month`
order by 1
)
select `month`, total_laid_off,
sum(total_laid_off) over(order by `month`) as rolling_total
from rolling_total;



select company, year(`date`) ,sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by company asc;


with company_year (company, years, total_laid_off) as
(
select company, year(`date`) ,sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), company_year_rank as
(
select *,
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking<=5;