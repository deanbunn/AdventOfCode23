<# 
    Script: aoc-day4.ps1
    Author: deanbunn
#>

#$string.Split(";",[System.StringSplitOptions]::RemoveEmptyEntries)
#($fdScratchCards | Select-Object -first 4)

#Var for Grand Total
[int]$nGrandTotal = 0;

#Load Input Data
$fdScratchCards = Get-Content -Path ./input.txt;

#Loop Through the Scratch Cards  
foreach($flScratchCard in $fdScratchCards)
{

    #Var for Card Title
    [string]$cardTitle = $flScratchCard.ToString().Split(":")[0].ToString();

    #Array of Winning Numbers
    $arrWinNmbrs = $flScratchCard.ToString().Split(":")[1].ToString().Split("|")[0].ToString().Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries);

    #Array of Player Numbers
    $arrPlayerNmbrs = $flScratchCard.ToString().Split(":")[1].ToString().Split("|")[1].ToString().Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries);

    [int]$nWinTotal = 0;

    $GoodCards = "";

    foreach($playerNmbr in $arrPlayerNmbrs)
    {

        foreach($winNmbr in $arrWinNmbrs)
        {
            if($playerNmbr -eq $winNmbr)
            {
                $GoodCards += $playerNmbr + " ";

                if($nWinTotal -eq 0)
                {
                    $nWinTotal = 1; 
                }
                else
                {
                    $nWinTotal = ($nWinTotal + $nWinTotal);
                }

            }
        }
    }
    
    $nGrandTotal += $nWinTotal;

    #Write-Output ($GoodCards + " : " + $nWinTotal);

}#End of $fdScratchCards Foreach


Write-Output $nGrandTotal.ToString();

