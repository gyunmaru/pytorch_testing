FROM pytorch/pytorch

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

COPY tkn /root/tkn
COPY git_* /root/

RUN apt-get install -y git &&\
    pip install --upgrade pip &&\
    pip install --upgrade setuptools &&\
    pip install ipywidgets
RUN git config --global user.email $(cat /root/git_email)
RUN git config --global user.name $(cat /root/git_usr)


