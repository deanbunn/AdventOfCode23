<# 
    Script: aoc-day3.ps1
    Author: deanbunn
#>

#Array for Whole Engine Schematic
$arrEngineSchematic = @();

#ArrayList of Special Characters
$alSpecialChars = [System.Collections.ArrayList]::new();
[void]$alSpecialChars.Add("@");
[void]$alSpecialChars.Add("*");
[void]$alSpecialChars.Add("/");
[void]$alSpecialChars.Add("\");
[void]$alSpecialChars.Add("-");
[void]$alSpecialChars.Add("+");
[void]$alSpecialChars.Add("&");
[void]$alSpecialChars.Add("#");
[void]$alSpecialChars.Add("$");
[void]$alSpecialChars.Add("%");
[void]$alSpecialChars.Add("=");

#Var for Grand Total
[int]$nGrandTotal = 0;

#Load Input Data
$fdEngineScheme = Get-Content -Path ./input.txt;

#Loop Through Each Line in the Input Data File 
for($h = 0; $h -lt $fdEngineScheme.Count; $h++)
{

    #Get Array of Values for the Current Line
    $arrCrntDataRow = $fdEngineScheme[$h].ToCharArray();

    #Var for Past Data Row
    $arrPastDataRow = @();

    #Var for Next Data Row
    $arrNextDataRow = @();

    #Var for Dynamic Number to Parse
    $dynNmbr = "";

    #Var for Push Number to List
    $bPshNmbr = $false;

    #Check for Past Data Row
    if($h -ne 0)
    {
        $arrPastDataRow = $fdEngineScheme[$h -1].ToCharArray();
    }

    #Check for Next Data Row
    if($h -lt ($fdEngineScheme.Count -1))
    {
        $arrNextDataRow = $fdEngineScheme[$h +1].ToCharArray();
    }

    #Loop Through Row Data Looking for Numbers to Check
    for($i = 0; $i -lt $arrCrntDataRow.Count; $i++)
    {

        #Check if Character is a Number
        if($arrCrntDataRow[$i].ToString() -match "\d")
        {

            #Add Number to Dynamic Number
            $dynNmbr += $arrCrntDataRow[$i];

            ######################################
            #Check for Part Number Values
            ######################################

            #Check for Previos Row Associated Values
            if($arrPastDataRow.Count -gt 0)
            {

                #Checking Upper Left Diagonal
                if($i -gt 0 -and $alSpecialChars.Contains($arrPastDataRow[$i -1].ToString()))
                {
                    $bPshNmbr = $true;
                }

                #Checking Directly Above
                if($alSpecialChars.Contains($arrPastDataRow[$i]).ToString())
                {
                    $bPshNmbr = $true;
                }

                #Checking Upper Right Diagonal
                if($i -lt ($arrPastDataRow.Count -2) -and $alSpecialChars.Contains($arrPastDataRow[$i +1].ToString()))
                {
                    $bPshNmbr = $true;
                }
                
            }

            #Check Current Row Associated Values Left Side
            if($i -gt 0 -and $alSpecialChars.Contains($arrCrntDataRow[$i -1].ToString()))
            {
                $bPshNmbr = $true;
            }

            #Check Current Row Associated Values Right Side
            if($i -lt ($arrCrntDataRow.Count -2) -and $alSpecialChars.Contains($arrCrntDataRow[$i +1].ToString()))
            {
                $bPshNmbr = $true;
            }

            #Check Next Row Associated Values
            if($arrNextDataRow.Count -gt 0)
            {

                if($i -gt 0 -and $alSpecialChars.Contains($arrNextDataRow[$i -1].ToString()))
                {
                    $bPshNmbr = $true;
                }

                if($alSpecialChars.Contains($arrNextDataRow[$i].ToString()))
                {
                    $bPshNmbr = $true;
                }

                if($i -lt ($arrNextDataRow.Count -2) -and $alSpecialChars.Contains($arrNextDataRow[$i +1].ToString()))
                {
                    $bPshNmbr = $true;
                }

            }
            
            #Check If At End of Line or The Next Character is Not a Number
            if(($i -eq ($arrCrntDataRow.Count -1)) -or ($arrCrntDataRow[$i +1].ToString() -match "\d" -eq $false))
            {

                #Check to Push The Number
                if($bPshNmbr -eq $true)
                {
                    $nGrandTotal += [int]$dynNmbr;          
                }

                #Reset the Dynamic and Push Value
                $bPshNmbr = $false
                $dynNmbr = "";

            }#End of End of the Line and Next Character Checks

        }#End of Character Digit Check

    }#End of For $crntDataRow Loop

}#End of $fdEngineScheme

Write-Output $nGrandTotal.ToString();

<#

The engine schematic (your puzzle input) consists of a visual representation of the engine. There are lots of numbers and symbols you don't really understand, but apparently any number adjacent to a symbol, even diagonally, is a "part number" and should be included in your sum. (Periods (.) do not count as a symbol.)

Here is an example engine schematic:

467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
In this schematic, two numbers are not part numbers because they are not adjacent to a symbol: 114 (top right) and 58 (middle right). Every other number is adjacent to a symbol and so is a part number; their sum is 4361.

Of course, the actual engine schematic is much larger. What is the sum of all of the part numbers in the engine schematic?

#>