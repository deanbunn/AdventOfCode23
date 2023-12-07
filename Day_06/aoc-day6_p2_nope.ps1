<# 
    Script: aoc-day6.ps1
    Author: deanbunn
#>

#Load Input Data
$fdBoatRaceResults = Get-Content -Path ./input.txt;

#Load Time Data
$dRaceTime = $fdBoatRaceResults[0].ToString().Replace(" ","").Split(":")[1].ToString();

#Load Distance Data
$dRaceDistance = $fdBoatRaceResults[1].ToString().Replace(" ","").Split(":")[1].ToString();

#Var for Race Winners Total
[double]$raceWinnerTotal = 1;

$boatRace = new-object PSObject -Property (@{ RaceNumber=0; RaceTime=0; RaceDistance=0; RaceWinners=@();});
$boatRace.RaceNumber = 0;
$boatRace.RaceTime = [double]$dRaceTime;
$boatRace.RaceDistance = [double]$dRaceDistance;
    
$boatRace.RaceTime.ToString();

$boatRace.RaceDistance.ToString();

<#
#Var for Distance Increment
$nDI = 0;

for($x = 1; $x -lt $boatRace.RaceTime; $x++)
{
    #Increase Distance Increment
    $nDI++;

    if(($nDI * ($boatRace.RaceTime -$x)) -gt $boatRace.RaceDistance)
    {
        $boatRace.RaceWinners += $x;
    }

}

$raceWinnerTotal = $raceWinnerTotal * $boatRace.RaceWinners.Count;

#Display Boat Race Data
$boatRace | Select-Object -Property RaceNumber,RaceTime,RaceDistance,RaceWinners;

Write-Output ("Race Winner Total: " + $raceWinnerTotal.ToString());

#>