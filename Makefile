program = mindustry


default:
	echo "Read Me"

package:
	docker build --build-arg PROGRAM=$(program) -t makedeb .
	docker run -it --rm -p 80 --name makedeb makedeb
cclean:
	docker rmi -f makedeb
