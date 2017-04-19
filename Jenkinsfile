node {
	properties([
	  	parameters([
	    		string(name: 'registry_url', defaultValue: ''),
	    		string(name: 'docker_creds_id', defaultValue: ''),
	   		string(name: 'dockHub_repo', defaultValue: ''),
	  	])
	])
	
    	docker.withRegistry("${params.registry_url}", "${params.docker_creds_id}") {
		stage "prepare"
       	 	git url: "https://github.com/gtunon/CI-kurento-hello-world.git", credentialsId: '${params.git_credentials_id}'
    
        	sh "git rev-parse HEAD > .git/commit-id"
        	def commit_id = readFile('.git/commit-id').trim()
        	println commit_id
		sh 'echo ${USER}'
		
		stage "build"		
			def app = docker.build "${params.dockHub_repo}/kurento-hello-world"

		stage "publish"
			sh 'echo ${params.registry_url}'
			sh 'echo ${params.docker_creds_id}'
		app.push 'master'
		app.push "${commit_id}"
    }
}
