FROM ubuntu:22.04

RUN <<EOF
  apt update
  apt-get update
  apt install -y sudo
EOF

ARG UID
ARG USERNAME 
ARG PASSWORD 
ARG GID
ARG GROUPNAME
RUN <<EOF
  groupadd -g $GID $GROUPNAME
  useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME
  echo $USERNAME:$PASSWORD | chpasswd
  echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
EOF
USER $USERNAME 
WORKDIR /home/$USERNAME/

RUN sudo apt install -y build-essential cmake curl ripgrep tar unzip vim wget zip

RUN sudo apt install tmux -y

RUN <<EOF
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  rm -rf nvim-linux64.tar.gz
EOF
ENV PATH="$PATH:/opt/nvim-linux64/bin"

RUN <<EOF
  sudo apt install software-properties-common -y
  sudo add-apt-repository ppa:git-core/ppa -y
  sudo apt install git -y
EOF

RUN <<EOF
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+') 
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
  rm -rf lazygit.tar.gz
EOF

RUN <<EOF
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt-get install -y nodejs
EOF

RUN sudo npm install -g pnpm

ARG GITUSERNAME 
ARG GITUSEREMAIL 

RUN <<EOF
  git config --global user.name $GITUSERNAME
  git config --global user.email $GITUSEREMAIL
EOF

COPY --chown=$USERNAME:$USERNAME ./nvim/ /home/$USERNAME/.config/nvim/
COPY --chown=$USERNAME:$USERNAME ./tmux.conf /home/$USERNAME/.tmux.conf

RUN mkdir /home/$USERNAME/projects/
