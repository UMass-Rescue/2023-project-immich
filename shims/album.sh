#!/bin/bash

# Replace text in side-bar.svelte
sed -i 's/Albums<\/p>/Case<\/p>/' web/src/lib/components/shared-components/side-bar/side-bar.svelte

# Replace text in +page.svelte
sed -i 's/Albums<\/p>/Case<\/p>/' "web/src/routes/(user)/sharing/+page.svelte"

# Replace text in side-bar.svelte with double quotes
sed -i 's/"Album"/"Case"/' "web/src/lib/components/shared-components/side-bar/side-bar.svelte"

# Replace text in +page.ts
sed -i 's/title: '\''Albums'\''/title: '\''Cases'\''/' "web/src/routes/(user)/albums/+page.ts"

# Replace text in side-bar.svelte with single quotes
sed -i "s/title='Albums'/title='Cases'/" "web/src/lib/components/shared-components/side-bar/side-bar.svelte"

# Replace text in constants.ts
sed -i 's/ALBUMS = '\''\/albums'\''/ALBUMS = '\''\/cases'\''/' "web/src/lib/constants.ts"

# Replace text in album.e2e-spec.ts
sed -i 's/album\//case\//' "server/e2e/api/specs/album.e2e-spec.ts"

# Replace text in activities_page.dart
sed -i 's/\/album/\/case/' "mobile/lib/modules/activities/views/activities_page.dart"

# Iterate through folders and replace text in files
foldersToModify=("mobile/lib" "mobile/openapi" "mobile/test" "open-api" "cli/src" "cli/test" "server/e2e" "server/src" "server/test" "web/src")

for folderPath in "${foldersToModify[@]}"; do
    find "$folderPath" -type f -exec sed -i 's/\/album/\/case/g' {} +
done

# Move folders
mv "web/src/routes/(user)/albums" "web/src/routes/(user)/cases"
mv "mobile/lib/modules/album" "mobile/lib/modules/case"
mv "mobile/test/modules/album" "mobile/test/modules/case"

