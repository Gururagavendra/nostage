#!/bin/bash
# Demo script for NoStage - creates a realistic demo scenario

echo "🎬 NoStage Demo - Recording Setup"
echo "=================================="
echo ""

# Setup
DEMO_DIR="/tmp/nostage-demo"
rm -rf "$DEMO_DIR"
mkdir -p "$DEMO_DIR"
cd "$DEMO_DIR"

# Initialize git repo
git init
git config user.email "demo@example.com"
git config user.name "Demo User"

# Install nostage
echo "📦 Installing NoStage..."
pip install nostage -q

# Initialize NoStage
echo ""
echo "🛡️  Initializing NoStage..."
nostage init

# Create some files
echo ""
echo "📝 Creating project files..."
echo "function myFeature() { return 'awesome'; }" > feature.js
echo "console.log('DEBUG: Testing feature');" > debug.js
echo "Test output data..." > test-output.txt

echo ""
echo "✨ Project structure:"
ls -la

# Protect debug files
echo ""
echo "🔒 Protecting debug files with NoStage..."
nostage add debug.js test-output.txt

# Show protected files
echo ""
nostage list

# Try to commit
echo ""
echo "📤 Attempting to commit all files with 'git add .' ..."
git add .
echo ""
echo "🚀 Running 'git commit -m \"Add feature\"' ..."
git commit -m "Add feature"

# Show what was committed
echo ""
echo "✅ What actually got committed:"
git show --name-only HEAD

echo ""
echo "🎉 Demo complete! Notice debug.js and test-output.txt were NOT committed!"
