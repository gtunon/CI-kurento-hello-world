node("${docker_node}") {
    docker.withRegistry("${registry_url}", "${docker_creds_id}") {
    
        git url: "https://github.com/gtunon/CI-kurento-hello-world.git", credentialsId: '${git_credentials_id}'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
		sh 'echo ${USER}'
		
        stage "build"
		sh "sudo chown jenkins /var/run/docker.sock"
		sh "sudo chown jenkins /usr/bin/docker"
		def app = docker.build "kurento-hello-world"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}