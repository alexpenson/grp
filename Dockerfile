FROM leela-zero:base

RUN apt-get install -y python python-tk
COPY goreviewpartner /
RUN sed -i \
    -e '90s|^.*$|command = leela-zero/src/leelaz|' \
    -e '91s|^.*$|parameters = --gtp --noponder --weights best-network|' \
    -e '96s|^.*$|command = leela-zero/src/leelaz|' \
    -e '97s|^.*$|parameters = --gtp --noponder --weights best-network|' \
    /goreviewpartner/config.ini
CMD ["python2","goreviewpartner/leela_zero_analysis.py", "--no-gui"]