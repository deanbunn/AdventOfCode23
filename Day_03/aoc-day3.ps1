<# 
    Script: aoc-day3.ps1
    Author: deanbunn
#>

# 140 Characters Each Line

#Array for Whole Engine Schematic
$arrEngineSchematic = @();

#Var for Row Number
[int]$nRowNbr = 0;

#Var for Dynamic First Row to Parse
$dynFRW = "";

#Var for Dynamic Next Row to Parse
$dynLRW = "";

#Var for Grand Total
[int]$nGrandTotal = 0;

#Load Engine Scheme Data Into Custom Array of Objects
foreach($flEngineSchem in (Get-Content -Path ./input.txt))
{
    #Custom Object 
    $cstEngSch = new-object PSObject -Property (@{ RowNum=0; RowChars=@(); RowData=""; });

    #Load Row Number
    $cstEngSch.RowNum = $nRowNbr;

    $cstEngSch.RowChars = $flEngineSchem.ToCharArray();

    $cstEngSch.RowData = $flEngineSchem;

    #Add Custom Object to Whole Engine Schematic Array
    $arrEngineSchematic += $cstEngSch;

    $nRowNbr++;

}#End of Input.txt Load


#Loop Through Custom Object Array
foreach($cEngineSchem in ($arrEngineSchematic | Sort-Object -Property RowNum | Select-Object -First 2))
{
    
    #Array of Characters for Active Row Data
    $arrCrntRowData = $cEngineSchem.RowData.ToCharArray();

    #Var for Dynamic Number to Parse
    $dynNmbr = "";

    #Var for Push Number to List
    $bPshNmbr = false;

    #Loop Through Row Data Looking for Numbers to Check
    for($i = 0; $i -lt $arrCrntRowData.Count; $i++)
    {

        #Check if Character is a Number
        if($arrCrntRowData[$i] -match "\d+")
        {
            $dynNmbr += $arrCrntRowData[$i];

            #Checks for Associated Symbols
            if((($i -ne 0) -and $arrCrntRowData[$i-1] -ne "."))
            {

            }

        }
        elseif([string]::IsNullOrEmpty($dynNmbr) -eq $false)
        {
            write-Output $dynNmbr; #Would be a Push with Part Number Status Check
            $dynNmbr = "";
        }
        else
        {
            $dynNmbr = "";
        }

    }
    
    

}

#Write-Output $arrEngineSchematic.Count;


#$arrEngineSchematic;



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