FROM ubuntu:20.04

ENV julia=julia-1.6.0

ENV julia_full=${julia}-linux-x86_64

RUN apt update && apt install -y git && apt install -y curl

COPY ./${julia_full}.tar.gz ./

COPY ./recepten_start.sh ./start.sh

RUN chmod u+x /start.sh && \
 mkdir julia && cp /${julia_full}.tar.gz /julia && \
 tar -xvf /julia/${julia_full}.tar.gz -C /julia/ && \
 ln -s /julia/${julia}/bin/julia /usr/local/bin/julia

RUN git clone https://github.com/rbontekoe/Recepten.git

RUN julia -e 'using Pkg; Pkg.add("LiveServer"); exit()'

WORKDIR /Recepten

CMD bash /start.sh
