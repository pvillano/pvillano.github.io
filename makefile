build: clean
	hugo

clean:
	rm -rf ./public/*

finalcheck: clean
	hugo server --disableFastRender

devserver: clean
	hugo server --buildDrafts --buildFuture --watch
