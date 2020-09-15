.PHONY: pip-compile tweets favorites download

download: tweets favorites

build/savetweets: Dockerfile requirements.in tweets.sh favorites.sh
	docker build . -t savetweets
	touch build/twitter-to-sqlite

tweets: build/savetweets
	docker run -it -v $$PWD/data:/data savetweets ./tweets.sh

favorites: build/savetweets
	docker run -it -v $$PWD/data:/data savetweets ./favorites.sh

requirements.in: requirements.txt
	pip-compile requirements.txt > requirements.in
