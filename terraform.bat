@echo off
echo Forwarding ports for Kubernetes services...

:: Port forward for mongo services
start /B cmd /c "kubectl port-forward svc/mongodb-k8s-services 27018:27017 -n blogportal"

:: Port forward for springboot service
start /B cmd /c "kubectl port-forward svc/springboot-k8s-services 8081:8080 -n blogportal"

:: Port forward for react service
start /B cmd /c "kubectl port-forward svc/react-k8s-services 3001:3000 -n blogportal"

echo All ports are being forwarded.
pause
