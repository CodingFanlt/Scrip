FROM golang


LABEL author="codingfanlt"
LABEL maintainer="codingfanlt@gmail.com"
LABEL version="1.0"

COPY config/.zshrc $HOME/

# install zsh
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git zsh curl \
    && chsh -s /bin/zsh \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

CMD [ "sh", "-c", "zsh"]