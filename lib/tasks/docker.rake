namespace :docker do
  desc "Push docker images to DockerHub"
  task :push_image do
    TAG = `git rev-parse --short HEAD`.strip

    puts "Building Docker image"
    sh "docker build -t psmir/community:#{TAG} ."

    IMAGE_ID = `docker images | grep psmir\/community | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} psmir/community:latest"

    puts "Pushing Docker image"
    sh "docker push psmir/community:#{TAG}"
    sh "docker push psmir/community:latest"

    puts "Done"
  end

end