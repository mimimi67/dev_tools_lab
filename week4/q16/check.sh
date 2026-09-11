#!/bin/bash
set -e
ruff format --check
ruff check
python3 -m pytest tests/

