class Message
{
    [String]$Char
    [int]$Padding
    [String]$MyMessage

    [void]DisplayMessage() {
        Write-Host -ForegroundColor Yellow "`n`n$($This.Surrounder($This.Padding, $This.Char))"
        Write-Host -ForegroundColor Yellow "### $($This.MyMessage) ###"
        Write-Host -ForegroundColor Yellow "$($This.Surrounder(8, "#"))`n"
    }

    [String]Surrounder([int]$Padding, [String]$Char) {
        [String]$MessageSurrounder = ""
        $MessageSurrounderLength = $This.MyMessage.Length + $Padding

        for ($i = 0; $i -lt $MessageSurrounderLength; $i++) {
            $MessageSurrounder = $MessageSurrounder + $Char
        }
        return $MessageSurrounder
    }

    Message([String]$MyMessage, [String]$Char, [int]$Padding) {
        [String]$This.Char = $Char
        [int]$This.Padding = $Padding
        [String]$This.MyMessage = $MyMessage
    }
}

$Mes = [Message]::New("Hello World!!!", "#", 8)
$Mes.DisplayMessage()