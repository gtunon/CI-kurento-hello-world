node("${docker_node}") {
    docker.withRegistry("${registry_url}", "${docker_creds_id}") {
    
        git url: "https://github.com/gtunon/CI-kurento-hello-world.git", credentialsId: '${git_credentials_id}'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
		sh 'echo ${USER}'
		
        stage "build"
		def app = docker.build "${dockHub_repo}/kurento-hello-world"
    
        stage "publish"
		sh 'echo ${registry_url}'
		sh 'echo ${docker_creds_id}'
        app.push 'master'
        app.push "${commit_id}"
    }
}