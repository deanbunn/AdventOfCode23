<# 
    Script: aoc-day7.ps1
    Author: deanbunn
#>

Function Check-Card($dCard)
{

    #Var for Return Value
    [int]$rtnAmount = 0;

    Switch($dCard)
    {
        "2" { $rtnAmount = 2; Break}
        "3" { $rtnAmount = 3; Break}
        "4" { $rtnAmount = 4; Break}
        "5" { $rtnAmount = 5; Break}
        "6" { $rtnAmount = 6; Break}
        "7" { $rtnAmount = 7; Break}
        "8" { $rtnAmount = 8; Break}
        "9" { $rtnAmount = 9; Break}
        "T" { $rtnAmount = 10; Break}
        "J" { $rtnAmount = 1; Break}
        "Q" { $rtnAmount = 12; Break}
        "K" { $rtnAmount = 13; Break}
        "A" { $rtnAmount = 14; Break}
    }

    #A, K, Q, J, T, 9, 8, 7, 6, 5, 4, 3, or 2
    
    Return $rtnAmount;

}

#Array for Custom Hand Data
$arrCstHandData = @();

#Load Input Data
$fdHandData = Get-Content -Path ./inputtest.txt;

foreach($fdHand in $fdHandData)
{

    #Custom Object for Hand and Bid Data
    $cstCardHand = new-object PSObject -Property (@{ Card1=0; Card2=0; Card3=0; Card4=0; Card5=0; Bid=0; Rank=0; HandValue=0; HandData="";});

    #Load Raw Cards in the Hand
    $cstCardHand.HandData = $fdHand.ToString().Split(" ")[0].ToString();

    #Load Bid Amount
    $cstCardHand.Bid = [int]$fdHand.ToString().Split(" ")[1].ToString();

    #Char Array for Hand Data
    $arrCards = $cstCardHand.HandData.ToCharArray();

    #Load Card Values
    $cstCardHand.Card1 = Check-Card($arrCards[0].ToString());
    $cstCardHand.Card2 = Check-Card($arrCards[1].ToString());
    $cstCardHand.Card3 = Check-Card($arrCards[2].ToString());
    $cstCardHand.Card4 = Check-Card($arrCards[3].ToString());
    $cstCardHand.Card5 = Check-Card($arrCards[4].ToString());

    #Group Cards by Count
    $arrGrpByCards = $arrCards | Group-Object -NoElement | Sort-Object -Property Count -Descending;

    foreach($gbc in $arrGrpByCards)
    {
        Write-Output $gbc;
    }

    #Count and Name

    #Determine Hand Value
    if($arrGrpByCards[0].Count -eq 5)
    {
        $cstCardHand.HandValue = 7;
    }
    elseif($arrGrpByCards[0].Count -eq 4)
    {
        $cstCardHand.HandValue = 6;
    }
    elseif($arrGrpByCards[0].Count -eq 3 -and $arrGrpByCards[1].Count -eq 2)
    {
        $cstCardHand.HandValue = 5;
    }
    elseif($arrGrpByCards[0].Count -eq 3 -and $arrGrpByCards[1].Count -eq 1)
    {
        $cstCardHand.HandValue = 4;
    }
    elseif($arrGrpByCards[0].Count -eq 2 -and $arrGrpByCards[1].Count -eq 2)
    {
        $cstCardHand.HandValue = 3;
    }
    elseif($arrGrpByCards[0].Count -eq 2 -and $arrGrpByCards[1].Count -eq 1)
    {
        $cstCardHand.HandValue = 2;
    }
    else
    {
        $cstCardHand.HandValue = 1;
    }
    
    #Add Custom Card Hand To Array
    $arrCstHandData += $cstCardHand;

}#End of $fdHandData Foreach

#Var for Rank Number
[int]$nRN = 1;

#Var for Winning Amount
[int]$nWinningAmt = 0;

foreach($cstHD in ($arrCstHandData | Sort-Object -Property HandValue,Card1,Card2,Card3,Card4,Card5))
{
    $nWinningAmt += $cstHD.Bid * $nRN;
    $nRN++;
}

Write-Output $nWinningAmt.ToString();

<#
$teststring.ToCharArray() |
   Group-Object -NoElement |
   Sort-Object -Property Count -Descending

#>