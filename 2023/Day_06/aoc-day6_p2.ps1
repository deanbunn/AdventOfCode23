<# 
    Script: aoc-day6_p2.ps1
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

#Var for Race Time
[double]$RaceTime = [double]$dRaceTime;

#Var for Race Distance
[double]$RaceDistance = [double]$dRaceDistance;

#Var for Distance Increment
[double]$nDI = 0;

#Var for Number of Winners
[double]$nWinners = 0;

for([double]$x = 1; $x -lt $RaceTime; $x++)
{
    #Increase Distance Increment
    $nDI++;

    if(($nDI * ($RaceTime -$x)) -gt $RaceDistance)
    {
        $nWinners++;
    }

}

$nWinners.ToString();
