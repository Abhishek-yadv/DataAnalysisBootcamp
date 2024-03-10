/*****************************************/
SELECT *
FROM PortfolioProject..CovidDeaths$
order by 3,4


SELECT *
FROM PortfolioProject..CovidVaccinations$
order by 3,4


/*****************************************/
/*Select Date that we are going to be using */
SELECT Location,date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths$
order by 1,2


/*****************************************/
/* Looking at total cases vs total deaths */
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS DeathPercentage
From PortfolioProject..CovidDeaths$
order by 1,2


/*****************************************/
/* Looking at total cases vs total deaths */
/* Show likelihood o dying if you covid in your country */
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS DeathPercentage
From PortfolioProject..CovidDeaths$
WHERE location like '%states%'
order by 1,2 


/*****************************************/
/* Looking at total cases vs population */
SELECT Location, date, Population, total_cases, (total_cases/population)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
-- WHERE location like '%states%'
order by 1,2


/*****************************************/
/* Looking at countries with highest Infection rate compared to population */
SELECT Location, Population,MAX(TOTAL_CASES) AS HighestinfectionCount, MAX(total_cases/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths$
-- WHERE location like '%states%'
GROUP BY Location, population
ORDER BY PercentPopulationInfected DESC


/*****************************************/
/* Showing countries with highest death count per population */
SELECT Location, Max(total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
GROUP BY location
ORDER BY TotalDeathCount DESC
/* but the problem is over here despite of ORDER BY TotalDeathCount in desc it doesn't give appropriate result */

SELECT *
FROM PortfolioProject..CovidDeaths$


/*****************************************/
/* now we're taking this and varchar255 over here and then we are converting it to an
integer */
SELECT Location, Max(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
GROUP BY Location
ORDER BY TotalDeathCount DESC


/* but we have a slight issue or we're now seeing a slight issue with our data in our data in the location section we have a few ones that really shouldn't be there ones like world,africa or south america these are grouping entire continents */
SELECT *
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
ORDER BY 1,2

/*AND NOW LET'S TRY*/
SELECT Location, Max(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
-- WHERE Location like '%states%'
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount DESC

/* Let's BREAK THINGS DOWN BY CONTINENT */
SELECT continent, Max(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
-- WHERE Location like '%states%'
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC

-- it's not perfect um north america looks like it's only including the numbers from the united states and not canada so we have some small issues in here 
SELECT location, Max(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
-- WHERE Location like '%states%'
WHERE continent is null
GROUP BY location
ORDER BY TotalDeathCount DESC

SELECT *
FROM CovidDeaths$
where continent is null

/*** Think about it ***/
SELECT location, Max(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
-- WHERE Location like '%states%'
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC

/******************************************/
/* LET'S BREAK THINGS DOWN BY CONTINENT */
SELECT continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent is null
GROUP BY continent
ORDER BY TotalDeathCount DESC
 -- NULL	3180238


 /******/
 SELECT continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent is NOT null
GROUP BY continent
ORDER BY TotalDeathCount DESC


/******/
-- Showing continents with the highest death count per population
SELECT continent, MAX(CAST(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
group by continent
ORDER BY TotalDeathCount DESC



/******/
-- GLOBAL NUMBERS
SELECT Location,date,total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
-- where location like '%states%'
WHERE Continent is not null
order by 1,2

/******/
SELECT Location,date,total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
-- where location like '%states%'
WHERE Continent is not null
order by 1,2


/******/
SELECT Date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY Date
ORDER BY 1,2


/******/
SELECT Date,SUM(new_cases)--, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY Date
ORDER BY 1,2

/******/
SELECT Date,SUM(new_cases), SUM(Cast(new_deaths as int)), SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY Date
ORDER BY 1,2


/******/
SELECT Date,SUM(new_cases) AS Total_cases, SUM(Cast(new_deaths as int)) AS Total_deaths, SUM(Cast(new_deaths as int))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY Date
ORDER BY 1,2

/******/
SELECT SUM(new_cases) AS Total_cases, SUM(Cast(new_deaths as int)) AS Total_deaths, SUM(Cast(new_deaths as int))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
--GROUP BY Date
ORDER BY 1,2



/**********************************************/
/*********************************************/
/* Looking at total population vs vaccination*/

SELECT *
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
ON dea.location = vac.location
and dea.date = vac.date

/* Think about it */
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
ON dea.location = vac.location
ORDER BY 1,2
 
 SELECT *
 FROM CovidDeaths$

 SELECT *
 FROM CovidVaccinations$


/* now total population vs vaccination */
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

/* summon new_vaccination */
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (PARTITION BY dea.Location)
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3
-- x Operand data type nvarchar is invalid for sum operator

/******/
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location)
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3


/******/
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY Dea.location, dea.Date) AS RollingPeopleVaccinated
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3


/******/
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY Dea.location, dea.Date) AS RollingPeopleVaccinated
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

/* Looking at total Population vs Vaccination */
/******/
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY Dea.location, dea.Date)
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

/******/
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
, (RollingPeopleVaccinated/population) * 100
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

/* you can't use a
column that you just created to then use the next one so what we need to do is we need to create either a cte or a temp table */

/************************************/
/***********************************/
/**********************************/
-- USE CTE
with PopvsVac (continent,location, date, population, New_vaccinated, RollingPeoplevaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY Dea.location, dea.Date) AS RollingPeopleVaccinated
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
)
SELECT *,(RollingPeoplevaccinated/population)*100
FROM PopvsVac

/* Number of column in CTE must be same along side table */

/********/
with PopvsVac (continent, location, date, population, new_vaccinated, RollingPeoplevaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY Dea.location, dea.Date) AS RollingPeopleVaccinated
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3
)

SELECT *, (RollingPeoplevaccinated/population)*100
FROM PopvsVac


/************************************************/
/************ TEMP TABLE ***********************/
DROP TABLE IF EXISTS #PercentpopulationVaccinated
CREATE TABLE #PercentpopulationVaccinated
(Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentpopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.Location ORDER BY Dea.location, dea.Date) AS RollingPeopleVaccinated
/* OR SUM(CONVERT(vac.new_vaccinations, int) */
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3

SELECT *, (RollingPeoplevaccinated/population)*100
FROM #PercentpopulationVaccinated


/*********************************************************/
/* Creating View to store data for later visualizations */
DROP VIEW IF EXISTS PercentPopulationVaccinated
CREATE View PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.Location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccination)*100
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
     ON dea.location = vac.location
	 and dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3

SELECT *
FROM PercentPopulationVaccinated





/***********************************************/
DROP VIEW IF EXISTS PercentPopulationVaccinated;
GO

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccination)*100
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
     ON dea.location = vac.location
--	 and dea.date = vac.date
	 AND CONVERT(DATETIME, dea.date, 120) = CONVERT(DATETIME, vac.date, 120)
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3
GO



