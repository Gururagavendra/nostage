#!/usr/bin/env python3
"""Test script to run NoStage directly without installation."""

import sys
from pathlib import Path

# Add the project root to Python path
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

from nostage.cli import main

if __name__ == "__main__":
    main()
