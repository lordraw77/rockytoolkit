#!/usr/bin/env pwsh
# rockytoolkit
# PowerShell conversion of the Docker build script

# Variables
$tag = "rockytoolkit"
$minver = 0
$maxver = 1
$dockerfilename = "Dockerfile"

# Build the Docker image
Write-Host "Building Docker image..." -ForegroundColor Green
docker build -f $dockerfilename . -t "${tag}:${maxver}.${minver}" --no-cache --compress

if ($LASTEXITCODE -ne 0) {
    Write-Error "Docker build failed!"
    exit 1
}

# Tag the image as latest
Write-Host "Tagging as latest..." -ForegroundColor Green
docker tag "${tag}:${maxver}.${minver}" "${tag}:latest"

# Tag for Docker Hub (lordraw repository)
Write-Host "Tagging for Docker Hub..." -ForegroundColor Green
docker tag "${tag}:${maxver}.${minver}" "lordraw/${tag}:${maxver}.${minver}"
docker tag "${tag}:latest" "lordraw/${tag}:latest"

# Push to Docker Hub
Write-Host "Pushing versioned image to Docker Hub..." -ForegroundColor Green
docker push "lordraw/${tag}:${maxver}.${minver}"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push versioned image!"
    exit 1
}

Write-Host "Pushing latest image to Docker Hub..." -ForegroundColor Green
docker push "lordraw/${tag}:latest"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to push latest image!"
    exit 1
}

Write-Host "Build and push completed successfully!" -ForegroundColor Green