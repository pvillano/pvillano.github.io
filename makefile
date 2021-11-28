build:
	hugo --cleanDestinationDir --destination docs && touch ./docs/.nojekyll

clean:
	rm -rf ./docs/* && touch ./docs/.nojekyll

finalcheck: clean
	hugo server --disableFastRender

devserver: clean
	hugo server --buildDrafts --buildFuture --watch
