.PHONY: pip-compile tweets favorites download

download: tweets favorites

tweets:
	docker run -v $$PWD/data:/data williamsmj/savetweets ./tweets.sh

favorites:
	docker run -v $$PWD/data:/data williamsmj/savetweets ./favorites.sh

build/savetweets: Dockerfile requirements.in tweets.sh favorites.sh
	docker build . -t williamsmj/savetweets
	touch build/twitter-to-sqlite

push: build/savetweets
	docker push williamsmj/savetweets

requirements.in: requirements.txt
	pip-compile requirements.in > requirements.txt
