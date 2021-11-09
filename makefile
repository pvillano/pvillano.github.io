build: clean
	hugo

clean:
	rm -rf ./public/*

server: clean
	hugo server --disableFastRender