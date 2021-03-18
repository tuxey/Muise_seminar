FROM terostech/multi-simulator

USER gitpod

RUN sudo apt install bash-completion -y
RUN sudo apt install git -y
RUN sudo apt install vim -y
RUN pip3 install numpy


