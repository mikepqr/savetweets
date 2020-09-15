# Usage

Requires Docker

 1. Clone
 2. Create data/auth.json
 3. `make` (default target downloads tweets since last run, and last 200
    favorites)

Output is tweets.db. Use [datasette](https://github.com/simonw/datasette) to
view.
