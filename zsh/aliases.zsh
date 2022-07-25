alias m='meta --exclude ${PWD##*/} $1'
alias x='meta --exclude ${PWD##*/} exec $1'

function killportprocess() {
    lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}

function mkcd() {
    mkdir $1 && cd $1
}

# Shows which files are sent to the docker build-context
# Helpful to verify which files are excluded by .dockerignore
function dockerBuildContext() {
    docker image build -t build-context -f - . <<EOF
FROM busybox
COPY . /build-context
WORKDIR /build-context
CMD find .
EOF
    docker container run --rm build-context
    docker image rm build-context
}

function pruneDockerImage() {
	# Get all images with the given repository name
	ALL_IMAGES=$(docker images -a --format="{{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}" | grep "$1")
	echo "All images:\n$ALL_IMAGES\n"

	# Find image ID tagged with "latest"
	LATEST_ID=$(echo $ALL_IMAGES | grep "\blatest\b" | awk '{print $3}')
	echo "Latest ID: $LATEST_ID"

	# Remove all images except the one tagged with "latest"
	IMAGES_TO_BE_REMOVED=$(echo "$ALL_IMAGES" | grep -v "$LATEST_ID" | awk '{print $3}')

	if [ -z "$IMAGES_TO_BE_REMOVED" ]; then
		echo "No images to be removed"
		echo "$IMAGES_TO_BE_REMOVED"
	else
		echo "Images to be removed:\n$IMAGES_TO_BE_REMOVED"
		echo $IMAGES_TO_BE_REMOVED | xargs docker rmi -f
		echo "Done"
	fi
}
