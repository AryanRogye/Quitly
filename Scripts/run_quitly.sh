#
//  run_quitly.sh
//  Quitly
//
//  Created by Aryan Rogye on 5/20/25.
//

#!/bin/bash

APP_NAME="Quitly"
DERIVED_DIR="$HOME/Library/Developer/Xcode/DerivedData"

echo "🔍 Searching for $APP_NAME.app in DerivedData..."

APP_PATH=$(find "$DERIVED_DIR" -type d -path "*/Build/Products/Debug/$APP_NAME.app" -not -path "*/Index.noindex/*" -print -quit 2>/dev/null)

if [[ -z "$APP_PATH" ]]; then
    echo "❌ Could not find $APP_NAME.app in DerivedData/Build/Products/Debug"
    exit 1
fi

if [[ ! -x "$APP_PATH/Contents/MacOS/$APP_NAME" ]]; then
    echo "❌ Found .app but executable is missing: $APP_PATH/Contents/MacOS/$APP_NAME"
    exit 1
fi

echo "✅ Found app at: $APP_PATH"
echo "🚀 Launching..."
open "$APP_PATH"
