ExecName="ddns-go"
GitCommit=$(git rev-parse --short HEAD || echo unsupported)
GoVersion=$(go version)
BuildTime=$(date "+%Y-%m-%d %H:%M:%S")
echo "Building..."
TargetDir=bin
CGO_ENABLED=0 go build -ldflags "-X 'main.version=$GitCommit' -X 'main.buildTime=$BuildTime' -X 'main.GoVersion=$GoVersion' -X 'naub.GitCommit=' -extldflags -static -w -s" -o $TargetDir/$ExecName
echo "--------------------------------------------"
echo "Git commit:" $GitCommit
echo "Go version:" $GoVersion
echo "Build Time:" $BuildTime
echo "Build Finish"
echo "--------------------------------------------"
