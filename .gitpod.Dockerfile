FROM terostech/multi-simulator

RUN apt install bash-completion -y
RUN apt install git -y
RUN apt install vim -y
RUN pip3 install numpy


