build:
	hugo --cleanDestinationDir --destination docs

finalcheck: clean
	hugo server --disableFastRender

devserver: clean
	hugo server --buildDrafts --buildFuture --watch
