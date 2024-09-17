FROM ubuntu:latest

RUN apt -y update && apt -y upgrade
RUN apt -y install micro
RUN apt -y install bash
RUN apt -y install curl
RUN apt -y install wget
RUN apt -y install git
RUN apt -y install nodejs
RUN apt -y install npm

# https://pnpm.io/installation
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -

# RUN npm install -g yarn
# RUN npm install -g next
RUN npm install -g nextui-cli
 
WORKDIR /opt

ARG PROJ_TEMPLATE_NAME

# RUN git clone https://github.com/nisabmohd/Aria-Docs.git ariadocs
# RUN git clone https://github.com/nextui-org/nextui.git
RUN git clone https://github.com/shuding/nextra-docs-template ${PROJ_TEMPLATE_NAME}
WORKDIR /opt/${PROJ_TEMPLATE_NAME} 
RUN /root/.local/share/pnpm/pnpm install

CMD ["/bin/bash"]
