# 수동 반영 Hands On
# 반드시 group00과 demo-kb00를 자기 환경에 맞게 수정하여 실행해야 함.

# Docker Build는 프로젝트 기본경로에서 수행해야함!
# docker build
docker build -f ./k8s/Dockerfile -t harbor.gaeco.net/group00/demo-kb00:0.1.1 .
# docker image list up
docker images
# push
docker login -u 'robot$cicduser01' -p 20eHBVOnaTgZmj0MjdakMhZU0bMLajaz harbor.gaeco.net
docker push harbor.gaeco.net/group00/demo-kb00:0.1.1

########################################
# 이 단계에서 harbor에 Docker Image가 등록되었는지 확인
# https://harbor.gaeco.net/harbor/projects/3/repositories/demo-kb00/artifacts-tab
########################################

# IBM Cloud Login
ibmcloud login --apikey chBbx4oZO6yrpQ8B07yIkJAG_tkeqvWzM9EoMgT6TMAw -a cloud.ibm.com -r jp-tok -g Default
# Set Locale
ibmcloud config --locale en_US
# set default cluster
ibmcloud ks cluster config --cluster bootcampcluster-tok02-c3c.16x32
#로그인 확인
kubectl get pods

########################################
# kubectl 수행전에 아래 Shell 수행
# cd k8s
# ./create_yaml.sh group00 demo-kb00
########################################

# deploy app as POD
kubectl apply -f ./deployment-demo-kb00.yaml
# create service
kubectl apply -f ./service-demo-kb00.yaml
# create ingress : 그룹 대표자 1명만 수행
kubectl apply -f ./ingress-demo-kb00.yaml

# 작동확인
curl -H "Host: demo-kb00.kbstar.com" http://161.202.66.186/actuator/health

# 생성한 pod, service, ingress 삭제
# delete app as POD
kubectl delete -f ./deployment-demo-kb00.yaml
# delete service
kubectl delete -f ./service-demo-kb00.yaml
# delete ingress
kubectl delete -f ./ingress-demo-kb00.yaml