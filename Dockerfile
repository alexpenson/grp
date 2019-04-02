FROM leela-zero:gpu

RUN apt-get install -y python python-tk 
COPY example.sgf .
COPY best-network .
COPY goreviewpartner .
COPY config.ini .
RUN cmake --build . --target leelaz --config Release -- -j2
ENTRYPOINT ["/bin/bash"]
# ENTRYPOINT ["python2", "leela_zero_analysis.py", "--no-gui"]
# CMD ["example.sgf"]