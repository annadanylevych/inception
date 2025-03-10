all:
	@mkdir -p /home/adanylev
	@mkdir -p /home/adanylev/data
	@mkdir -p /home/adanylev/data/mysql /home/adanylev/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@rm -rf /home/adanylev/data
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm inception

re: clean all
