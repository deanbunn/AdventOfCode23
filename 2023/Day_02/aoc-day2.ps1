<# 
    Script: aoc-day2.ps1
    Author: deanbunn
#>

#Var for Games Possible Total
[int]$nGamesPossTotal = 0;

#Var for Game Power Total
[int]$nGamesPossPowerTotal = 0;

foreach($flCubeGame in (Get-Content -Path ./input.txt))
{

    #Var for Game Number
    [string]$nGameNbr = $flCubeGame.ToString().Split(":")[0].Replace("Game ","");

    #Var for Game Set Raw
    [string]$strGameSetRaw = $flCubeGame.ToString().Split(":")[1];

    #Var for Game Possible
    $bGamePossible = $true;

    #Var for Required Red Cubes
    [int]$nRequiredCubesRed = 0;

    #Var for Required Green Cubes
    [int]$nRequiredCubesGreen = 0;

    #Var for Required Blue Cubes 
    [int]$nRequiredCubesBlue = 0;

    foreach($gameSet in $strGameSetRaw.ToString().Split(";"))
    {
        #Var for Number Red Cubes
        [int]$nCubesRed = 0;

        #Var for Number Green Cubes
        [int]$nCubesGreen = 0;

        #Var for Number Blue Cubes
        [int]$nCubesBlue = 0;

        foreach($gSet in $gameSet.ToString().Split(","))
        {

            if($gSet.Contains("red"))
            {
                $nCubesRed += [int]($gSet.Replace(" red","").Trim())
            }

            if($gSet.Contains("green"))
            {
                $nCubesGreen += [int]($gSet.Replace(" green","").Trim())
            }

            if($gSet.Contains("blue"))
            {
                $nCubesBlue += [int]($gSet.Replace(" blue","").Trim())
            }
             
        }

        #Check Game Set for Possible Game
        if($nCubesRed -gt 12 -or $nCubesGreen -gt 13 -or $nCubesBlue -gt 14)
        {
            $bGamePossible = $false;
        }

        #Check Required Red Cubes Values
        if($nRequiredCubesRed -lt $nCubesRed)
        {
            $nRequiredCubesRed = $nCubesRed;
        }

        #Check Required Green Cubes Values
        if($nRequiredCubesGreen -lt $nCubesGreen)
        {
            $nRequiredCubesGreen = $nCubesGreen;
        }

        #Check Required Blue Cubes Values
        if($nRequiredCubesBlue -lt $nCubesBlue)
        {
            $nRequiredCubesBlue = $nCubesBlue;
        }
        
    }

    if($bGamePossible -eq $true)
    {
        $nGamesPossTotal += [int]$nGameNbr;
    }
    
    $nGamesPossPowerTotal += ($nRequiredCubesRed * $nRequiredCubesGreen * $nRequiredCubesBlue)

}

$nGamesPossTotal.ToString();

$nGamesPossPowerTotal.ToString();
