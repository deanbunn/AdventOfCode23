<#
    Script: aoc-day1.ps1
    Author: deanbunn
#>

#Var for Grand Total
[int]$nGrandTotal = 0;

#Loop Through the Calibration Values Input File
foreach($flCalVal in (Get-Content -Path ./input.txt))
{

    #String Array for Numbers Found on Each Line
    $arrNFEL = @();

    #Var for Two Digit Number of Each Line Entry
    [string]$tdNmbr = "";

    #Var for Dynamic Calibration Value
    [string]$strCalVal = $flCalVal;

    
    DO
    {

        if($strCalVal.StartsWith("0") -or $strCalVal.StartsWith("zero"))
        {
            $arrNFEL += "0";
        }
        elseif($strCalVal.StartsWith("1") -or $strCalVal.StartsWith("one"))
        {
            $arrNFEL += "1";
        }
        elseif($strCalVal.StartsWith("2") -or $strCalVal.StartsWith("two"))
        {
            $arrNFEL += "2";
        }
        elseif($strCalVal.StartsWith("3") -or $strCalVal.StartsWith("three"))
        {
            $arrNFEL += "3";
        }
        elseif($strCalVal.StartsWith("4") -or $strCalVal.StartsWith("four"))
        {
            $arrNFEL += "4";
        }
        elseif($strCalVal.StartsWith("5") -or $strCalVal.StartsWith("five"))
        {
            $arrNFEL += "5";
        }
        elseif($strCalVal.StartsWith("6") -or $strCalVal.StartsWith("six"))
        {
            $arrNFEL += "6";
        }
        elseif($strCalVal.StartsWith("7") -or $strCalVal.StartsWith("seven"))
        {
            $arrNFEL += "7";
        }
        elseif($strCalVal.StartsWith("8") -or $strCalVal.StartsWith("eight"))
        {
            $arrNFEL += "8";
        }
        elseif($strCalVal.StartsWith("9") -or $strCalVal.StartsWith("nine"))
        {
            $arrNFEL += "9";
        }
        
        #Remove the first character of the Dynamic Calibration Value
        $strCalVal = $strCalVal.substring(1);

    }While([string]::IsNullOrEmpty($strCalVal) -eq $false)


    <#
    #Loop Through Each Character On the Line Entry
    foreach($cvChar in $flCalVal.ToCharArray())
    {
        #Check for Numbers. Add Them to Numbers Line Array
        if($cvChar -match "\d+")
        {
            $arrNFEL += $cvChar;
        }
        
    }
    #>

    $tdNmbr = $arrNFEL[0] + $arrNFEL[$arrNFEL.Count -1];

    $nGrandTotal += [int]$tdNmbr;

}

#Display Grand Total
$nGrandTotal.ToString();

<#
Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and last digit on each line. For example:

two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen

In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

#>