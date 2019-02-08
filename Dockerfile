FROM leela-zero:gpu

RUN apt-get install -y python python-tk 
COPY example.sgf .
COPY best-network .
COPY goreviewpartner .
RUN cmake --build . --target leelaz --config Release -- -j2
ENTRYPOINT ["python2"]
CMD ["python2", "leela_zero_analysis.py", "--no-gui"]