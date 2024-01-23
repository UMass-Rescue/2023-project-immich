$candleToolPath = "candle"
$lightToolPath = "light"

try
{
    Push-Location $PSScriptRoot

    $wxsFileName = "Product.wxs"
    $wixobjFileName = "Product.wixobj"
    $msiFileName = "Product.msi"

    # compiling wxs file into wixobj
    & "$candleToolPath" $wxsFileName -out $wixobjFileName
    if($LASTEXITCODE -ne 0)
    {
        throw "Compilation of $wxsFileName failed with exit code $LASTEXITCODE"
    }

    # linking wixobj into msi
    & "$lightToolPath" $wixobjFileName -out $msiFileName
    if($LASTEXITCODE -ne 0)
    {
        throw "Linking of $wixobjFileName failed with exit code $LASTEXITCODE"
    }
}
catch
{
    Write-Error $_
    exit 1
}
finally
{
    Pop-Location
}
