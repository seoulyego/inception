# Repository 인덱스 업데이트
brew update

# 도커 설치
brew install docker

# 도커 소켓 /var/run/docker.sock 권한 666 설정하여 다른 사용자도 접근할 수 있도록 변경
sudo ln -s -f ~/.docker/run/docker.sock /var/run/docker.sock
sudo chmod 666 ~/.docker/run/docker.sock

# 도커 컴포즈 설치 (1.29.2 버전)
brew install docker-compose

# 도커 컴포즈 실행 권한 부여
# sudo chmod +x /usr/local/bin/docker-compose

# 도커 서비스 재시작 시 컨테이너를 종료하지 않도록 설정
sudo su -c 'printf "{\n\t\"live-restore\": true\n}" > ~/.docker/daemon.json'

# 도커 서비스 재시작
# sudo systemctl restart docker
