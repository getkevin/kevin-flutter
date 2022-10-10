#!/bin/sh

# 1. Navigate to root
cd ../..
# 2. Run tests in `lib`
flutter test
# 3. Run tests in `data`
(
  cd data || exit
  flutter test
)
# 4. Run tests in `domain`
(
  cd domain || exit
  flutter test
)