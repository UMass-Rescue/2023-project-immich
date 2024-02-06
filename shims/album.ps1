(Get-Content -path web/src/lib/components/shared-components/side-bar/side-bar.svelte -Raw) -replace "Albums</p>", "Case</p>" | Set-Content web/src/lib/components/shared-components/side-bar/side-bar.svelte 
(Get-Content -path "web/src/routes/(user)/sharing/+page.svelte" -Raw) -replace "Albums</p>", "Case</p>" | Set-Content "web/src/routes/(user)/sharing/+page.svelte" 
(Get-Content -path "web/src/lib/components/shared-components/side-bar/side-bar.svelte" -Raw) -replace '"Album"', '"Case"' | Set-Content "web/src/lib/components/shared-components/side-bar/side-bar.svelte" 
(Get-Content -path "web/src/routes/(user)/albums/+page.ts" -Raw) -replace "title: 'Albums'", "title: 'Cases'" | Set-Content "web/src/routes/(user)/albums/+page.ts" 
(Get-Content -path "web/src/lib/components/shared-components/side-bar/side-bar.svelte" -Raw) -replace 'title="Albums"', 'title="Cases"' | Set-Content "web/src/lib/components/shared-components/side-bar/side-bar.svelte" 
(Get-Content -path "web/src/lib/constants.ts" -Raw) -replace "ALBUMS = '/albums'", "ALBUMS = '/cases'" | Set-Content "web/src/lib/constants.ts" 
(Get-Content -path "server/e2e/api/specs/album.e2e-spec.ts" -Raw) -replace "album/", "case/" | Set-Content "server/e2e/api/specs/album.e2e-spec.ts" 
(Get-Content -path "mobile/lib/modules/activities/views/activities_page.dart" -Raw) -replace "/album", "/case" | Set-Content "mobile/lib/modules/activities/views/activities_page.dart" 

$foldersToModify = @("mobile/lib", "mobile/openapi", "mobile/test", "open-api", "cli/src", "cli/test", "server/e2e", "server/src", "server/test", "web/src")
foreach ($folderPath in $foldersToModify) {
    Get-ChildItem -LiteralPath $folderPath -File -Recurse | ForEach-Object {
        $filePath = $_.FullName

        # Check if the item is a file
        if ($_ -is [System.IO.FileInfo]) {
            $content = Get-Content -LiteralPath $filePath -Raw
            $newContent = $content -replace "/album", "/case"
            Set-Content -LiteralPath $filePath -Value $newContent
        }
    }
}


mv "web/src/routes/(user)/albums" "web/src/routes/(user)/cases"
mv "mobile/lib/modules/album" "mobile/lib/modules/case"
mv "mobile/test/modules/album" "mobile/test/modules/case"
