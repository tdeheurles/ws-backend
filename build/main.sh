# Copy go prog to docker context
cp ./ws-backend.go ./build/container/

# import names
. ./build/release.cfg

# artifact tag
artifact_tag="$servicemajor.$serviceminor.$BUILD_NUMBER"

# PRIVATE
artifact_name="gcr.io/$projectid/$servicename"
artifact_name_tagged="$artifact_name:$artifact_tag"

# Build
docker build -t $artifact_name ./build/container/
docker tag $artifact_name $artifact_name_tagged

# Push to Google Cloud Engine
gcloud docker push $artifact_name
gcloud docker push $artifact_name_tagged
