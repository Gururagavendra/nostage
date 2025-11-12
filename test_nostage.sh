#!/bin/bash
# Quick test script for NoStage

echo "🧪 NoStage Test Suite"
echo "===================="
echo ""

# Alias for easy use
alias nostage='python3 /home/guru/guru/hooker/nostage_cli.py'

echo "1️⃣  Testing nostage init..."
cd /tmp
rm -rf test-repo
mkdir test-repo
cd test-repo
git init
python3 /home/guru/guru/hooker/nostage_cli.py init
echo "✅ Init complete"
echo ""

echo "2️⃣  Creating test files..."
echo "console.log('debug')" > debug.js
echo "real code" > feature.js
git config user.email "test@test.com"
git config user.name "Test"
echo "✅ Files created"
echo ""

echo "3️⃣  Protecting debug.js..."
python3 /home/guru/guru/hooker/nostage_cli.py add debug.js
echo "✅ File protected"
echo ""

echo "4️⃣  Listing protected files..."
python3 /home/guru/guru/hooker/nostage_cli.py list
echo ""

echo "5️⃣  Attempting to commit all files..."
git add .
echo ""
echo "--- Running commit (debug.js should be auto-unstaged) ---"
git commit -m "Test commit"
echo ""

echo "6️⃣  Checking what was committed..."
git show --name-only HEAD
echo ""

echo "7️⃣  Checking git status..."
git status
echo ""

echo "✅ Test complete!"
echo ""
echo "If debug.js is still untracked, the tool works perfectly! 🎉"
