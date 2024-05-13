select *
from PortfolioProject..CovidDeaths
order by 3,4

--select *
--from PortfolioProject..CovidVaccines
--Order by 3,4

select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..CovidDeaths
order by 1,2

--looking at total cases vs total deaths
--Shows death rate of covid
select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%South Africa%'
order by 1,2

--looking total cases vs population
--shows percentage of population that got covid
select location,date,population, total_cases, (total_cases/population)*100 as InfectionRate
from PortfolioProject..CovidDeaths
where location like '%South Africa%'
order by 1,2

--looking at countries with the highest infection rate compared to population
select location,population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as HighestInfectionRate
from PortfolioProject..CovidDeaths
--where location like '%South Africa%'
Group by location,population
order by HighestInfectionRate desc

--countries with the highest death count per population
select location, MAX(cast(Total_deaths as Int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%South Africa%'
where continent is not Null
Group by location
order by TotalDeathCount desc

--lets break it down by continent
-- Showing continents with the highest death counts
select location, MAX(cast(Total_deaths as Int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%South Africa%'
where continent is Null
Group by location
order by TotalDeathCount desc

--GLOBAL NUMBERS

select date,SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(New_deaths as int))/SUM(New_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%South Africa%'
where continent is not null
Group by date
order by 1,2

--Join the two tables

Select *
From PortfolioProject..CovidDeaths d
Join PortfolioProject..CovidVaccines v
	on d.location = v.location
	and d.date = v.date

-- looking at total Population vs Vaccinations
--**************
--USING CTE
with PopvsVac ( Continent, Location, Date, Population,New_Vaccinations, RollingPeopleVaccinated)
as
(
Select d.continent, d.location, d.date, d.population, v.new_vaccinations
, SUM(cast(v.new_vaccinations as int)) over ( Partition by d.location Order 
by d.location,d.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths d
Join PortfolioProject..CovidVaccines v
	on d.location = v.location
	and d.date = v.date
	where d.continent is not null
--	order by 2,3
)
Select*, (RollingPeopleVaccinated/Population)*100
From PopvsVac

--TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric,
)

Insert into #PercentPopulationVaccinated
Select d.continent, d.location, d.date, d.population, v.new_vaccinations
, SUM(cast(v.new_vaccinations as int)) over ( Partition by d.location Order 
by d.location,d.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths d
Join PortfolioProject..CovidVaccines v
	on d.location = v.location
	and d.date = v.date
-- 	where d.continent is not null
--	order by 2,3
Select*, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


 -- Creating view to store data for later visualizations
 --**************************
 CREATE VIEW PercentPopulationVaccinated 
 as
 Select d.continent, d.location, d.date, d.population, v.new_vaccinations
, SUM(cast(v.new_vaccinations as int)) over ( Partition by d.location Order 
by d.location,d.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths d
Join PortfolioProject..CovidVaccines v
	on d.location = v.location
	and d.date = v.date
 	where d.continent is not null
	--order by 2,3

Select *
From PercentPopulationVaccinated
