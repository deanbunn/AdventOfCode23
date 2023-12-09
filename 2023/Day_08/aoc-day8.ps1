<# 
    Script: aoc-day8.ps1
    Author: deanbunn
#>

#Load Base Directions Data
[string]$baseDirections = (Get-Content -Path ./input.txt -TotalCount 1).ToString();

#Load Node Elements
$fdNodeElements = Get-Content -Path ./input.txt | Select -Skip 2; 

#Var for Full Directions
[string]$fullDirections = $baseDirections;

while($fullDirections.Length -lt $fdNodeElements.Count)
{
    $fullDirections += $baseDirections.Trim();
}

#Replace Direction Letters with Array Placements
$fullDirections = $fullDirections.Replace("R","1").Replace("L","0");

#Var Total Number of Steps from AAA to ZZZ
[int]$nTotalSteps = 0;

#Var for Dynamic Node Value
[string]$dynNodeValue = "AAA";

#Var for Next to Last Node
$bNLN = $false;

#Var for Stop Nodes Repeating
$bSNR = $false;


Do 
{
    #Loop Through Node Elements
    foreach($nodeElmnt in $fdNodeElements)
    {

        if($nodeElmnt.ToString().StartsWith($dynNodeValue) -eq $true)
        {   
            #Array For Next Directions
            $arrNextDirections = $nodeElmnt.ToString().Split("=")[1].ToString().Replace(" ","").Replace("(","").Replace(")","").Split(",");

            $dynNodeValue = $arrNextDirections[[int]($fullDirections.ToCharArray()[0].ToString())].ToString();

            if($dynNodeValue -eq "ZZZ")
            {
                $bNLN = $true;
            }

            #Write-Output $dynNodeValue;

            $fullDirections = $fullDirections.substring(1);

            if($nodeElmnt.ToString().StartsWith("ZZZ") -eq $true -and $bNLN -eq $true)
            {
                $bSNR = $true;
                break;
            }

            #Increment Total Steps to ZZZ
            $nTotalSteps++;

        }

        if($fullDirections.Length -lt 25)
        {
            $fullDirections += $baseDirections.Trim();
            $fullDirections = $fullDirections.Replace("R","1").Replace("L","0");

        }

    }

}While ($bSNR -eq $false)

Write-Output $nTotalSteps.ToString();

#Remove the first character of the Dynamic Calibration Value
#$strCalVal = $strCalVal.substring(1);