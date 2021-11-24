--select *
--From PortfolioProject..[owid-covid-data_deaths]
--order by 3, 4

--select *
--From PortfolioProject..[owid-covid-data_vaccinations]
--order by 3, 4

--Select Location, date, total_cases, new_cases, total_deaths, population
--From PortfolioProject..[owid-covid-data_deaths]
--order by 1, 2

-- Looking at total cases vs total deaths. Shows the percentage of those died because they were 
-- infected with COVID

--Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
--From PortfolioProject..[owid-covid-data_deaths]
--Where location like '%states%'
--order by 1, 2

-- Looking at total cases vs population. Shows what percentage of the population has COVID.

--Select Location, date, population, total_cases, (total_cases/population)*100 as PopulationPercentageInfected
--From PortfolioProject..[owid-covid-data_deaths]
----Where location like '%states%'
--order by 1, 2


-- Looking at countries with highest infection rate compared to population

--Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PopulationPercentageInfected
--From PortfolioProject..[owid-covid-data_deaths]
--Group by location, population
--order by PopulationPercentageInfected desc

-- Looking at countries with the highest death count per poplation

--select *
--From PortfolioProject..[owid-covid-data_deaths]
--Where [continent] is not null
--order by 3, 4 

--Select Location, MAX(cast(Total_deaths as bigint)) as TotalDeathCount
--From PortfolioProject..[owid-covid-data_deaths]
--Where [continent] is not null
--Group by location
--order by TotalDeathCount desc

-- Looking at total death count for every continent (note, these results is *not* accurate)

--Select continent, MAX(cast(Total_deaths as bigint)) as TotalDeathCount
--From PortfolioProject..[owid-covid-data_deaths]
--Where continent is not null
--Group by continent
--order by TotalDeathCount desc


-- Looking at global numbers; min 43 in Alex the Analyst YT Portfolio video

--Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as Death_Percentage
--From PortfolioProject..[owid-covid-data_deaths]
--Where continent is not null
--group by date
--order by 1, 2

-- Use CTE
--With PopvsVac (Continent, location, date, population, new_vaccinations, Rolling_people_vaccinated) as
--(
--select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated
--From PortfolioProject..[owid-covid-data_deaths] dea
--Join PortfolioProject..[owid-covid-data_vaccinations] vac
--	on dea.location = vac.location
--	and dea.date = vac.date
--where dea.continent is not null
----order by 2, 3
--)
--Select *, (Rolling_people_vaccinated/population)*100 as Pct_of_people_vaccinated
--From PopvsVac

-- Use Temp table

DROP Table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
Rolling_people_vaccinated numeric
)


Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated
From PortfolioProject..[owid-covid-data_deaths] dea
Join PortfolioProject..[owid-covid-data_vaccinations] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null

Select *, (Rolling_people_vaccinated/population)*100 as Pct_of_people_vaccinated
From #PercentPopulationVaccinated

-- Creating view to store data for future visualizations

Create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated
From PortfolioProject..[owid-covid-data_deaths] dea
Join PortfolioProject..[owid-covid-data_vaccinations] vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null

select *
from PercentPopulationVaccinated