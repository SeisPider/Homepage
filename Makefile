USER=xiaox17
PASSWD=20170815

all: build

build: 
	hugo
deploy: clean build
	wget -P ./public/ https://raw.githubusercontent.com/SeisPider/CV/master/cv.pdf
	lftp -c "set ftps:initial-prot -a'';open ftp://${USER}:${PASSWD}@home.ustc.edu.cn:21; mirror -eRv public public_html; quit;"
clean:
	-rm -r public/
