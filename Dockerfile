FROM ubuntu:23.10

# for Docker in Docker
RUN apt update && apt upgrade -y
RUN apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt update && apt install -y docker-ce docker-ce-cli containerd.io

# for act(Test GitHub Actions on local)
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN apt install -y gcc
RUN export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" && brew install act
RUN curl https://raw.githubusercontent.com/nektos/act/master/install.sh | bash
