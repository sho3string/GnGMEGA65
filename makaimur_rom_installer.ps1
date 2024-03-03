
$WorkingDirectory = Get-Location
$inFile = Join-Path $WorkingDirectory "gg1.bin"
$outPrefix = Join-Path $WorkingDirectory"/arcade/gng" "gg1_"
$SizeToCopy = 8192
$outputFile = "/arcade/gng/gngcfg"
$length3 = 53


function split($inFile,$outPrefix, [Int32] $bufSize){

  $stream = [System.IO.File]::OpenRead($inFile)
  $chunkNum = 1
  $barr = New-Object byte[] $bufSize

  while( $bytesRead = $stream.Read($barr,0,$bufsize)){
    $outFile = "$outPrefix" + "$chunkNum" + ".bin"
    $ostream = [System.IO.File]::OpenWrite($outFile)
    $ostream.Write($barr,0,$bytesRead);
    $ostream.close();
    echo "wrote $outFile"
    $chunkNum += 1
  }
}
	cls
	Write-Output " .------------------------------."
	Write-Output " |Building Makaimura ROMs       |"
	Write-Output " '------------------------------'"

	New-Item -ItemType Directory -Path $WorkingDirectory"/arcade" -Force
	New-Item -ItemType Directory -Path $WorkingDirectory"/arcade/gng" -Force


	Write-Output "Building CPU ROM"
	cmd /c copy /b 8n.rom+10n.rom+12n.rom $WorkingDirectory"/arcade/gng/rom1.bin"
	Write-Output "Splitting Character ROM"
	split $inFile $outPrefix 8192
	Write-Output "Copying Sound CPU ROM"
	cmd /c copy /b gg2.bin $WorkingDirectory"/arcade/gng/"
	Write-Output "Building Tile ROMs"
	cmd /c copy /b gg7.bin+gg6.bin $WorkingDirectory"/arcade/gng/rom76.bin"
	cmd /c copy /b gg9.bin+gg8.bin $WorkingDirectory"/arcade/gng/rom98.bin"
	cmd /c copy /b gg11.bin+gg10.bin $WorkingDirectory"/arcade/gng/rom1110.bin"
	Write-Output "Building Sprite ROMs"
	cmd /c copy /b gng13.n4+gg16.bin+gg15.bin+gg15.bin $WorkingDirectory"/arcade/gng/spr1.bin"
	cmd /c copy /b gng16.l4+gg13.bin+gg12.bin+gg12.bin $WorkingDirectory"/arcade/gng/spr2.bin"
	
	
	Write-Output "Generate config file"
	$null | Out-File -FilePath $WorkingDirectory"/arcade/gng/temp.txt"
	1..$length3 | ForEach-Object {
		Add-Content -Path "temp.txt" -Value "ff"
	}
	certutil.exe -f -decodehex temp.txt $WorkingDirectory$outputFile > $null
	Remove-Item -Path $WorkingDirectory"/arcade/gng/temp.txt"

	Write-Output "All done!"
	