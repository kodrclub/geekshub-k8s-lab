jon:
	@docker-compose -f ./compose/jenkins_build.yml up -d

joff:
	@docker-compose -f ./compose/jenkins_build.yml down

jps:
	@docker-compose -f ./compose/jenkins_build.yml ps

jlogs:
	@docker-compose -f ./compose/jenkins_build.yml logs -f
