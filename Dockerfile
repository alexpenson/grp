FROM leela-zero:base

RUN apt-get install -y python python-tk
CMD ["python2","goreviewpartner/leela_zero_analysis.py", "--no-gui"]