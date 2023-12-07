<# 
    Script: aoc-day6.ps1
    Author: deanbunn
#>

#Load Input Data
$fdBoatRaceResults = Get-Content -Path ./input.txt;

#Load Time Data Into Array
$arrRaceTimes = $fdBoatRaceResults[0].ToString().Split(":")[1].ToString().Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries);

#Load Distance Data Into Array
$arrRaceDistances = $fdBoatRaceResults[1].ToString().Split(":")[1].ToString().Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries);

#Array for Custom Boat Race Data
$arrBoatRaceData = @();

#Var for Race Winners Total
[int]$raceWinnerTotal = 1;

for($i = 0; $i -lt $arrRaceTimes.Count; $i++)
{
    $cstBoatRace = new-object PSObject -Property (@{ RaceNumber=0; RaceTime=0; RaceDistance=0; RaceWinners=@();});
    $cstBoatRace.RaceNumber = $i;
    $cstBoatRace.RaceTime = [int]$arrRaceTimes[$i];
    $cstBoatRace.RaceDistance = [int]$arrRaceDistances[$i];
    $arrBoatRaceData += $cstBoatRace;
}

foreach($boatRace in $arrBoatRaceData)
{

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

}#End of $arrBoatRaceData Foreach

#Display Boat Race Data
$arrBoatRaceData | Sort-Object -Property RaceNumber | Select-Object -Property RaceNumber,RaceTime,RaceDistance,RaceWinners;

Write-Output ("Race Winner Total: " + $raceWinnerTotal.ToString());
