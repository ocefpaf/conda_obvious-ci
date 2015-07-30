FROM scratch

ADD centos-5-20150304_1234-docker.tar.xz /

MAINTAINER Filipe Fernandes <ocefpaf@gmail.com>

RUN yum -y update

# Install conda and obvious-ci.
RUN wget https://raw.githubusercontent.com/pelson/Obvious-CI/v0.3.0/bootstrap-obvious-ci-and-miniconda.py
RUN python bootstrap-obvious-ci-and-miniconda.py ~/miniconda x64 2 --without-obvci && source ~/miniconda/bin/activate root
RUN conda config --add channels ioos --force
RUN conda install --yes obvious-ci
RUN obvci_install_conda_build_tools.py
RUN conda update --yes --all

# Patch.
RUN yum install -y patch file

# Qt, matplotlib deps, vispy
RUN yum install -y libXext libSM libXrender fontconfig mesa-libGL

# octant.
RUN yum install -y gcc-gfortran

# Udunits2
RUN yum install -y expat-devel

# rasterio.
RUN yum install -y compat-expat1.i686

# nco.
RUN yum install -y bison byacc flex gsl-devel antlr
