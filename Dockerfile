FROM centos:6

MAINTAINER Filipe Fernandes <ocefpaf@gmail.com>

RUN yum -y update && yum clean all

# Some build tools.
RUN yum install -y tar bzip2 patch file make gcc-c++ wget git libtool texinfo

# Install conda and obvious-ci.
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh

RUN wget http://bit.ly/miniconda -O miniconda.sh
RUN bash miniconda.sh -b -p /opt/conda && rm miniconda.sh
RUN /opt/conda/bin/conda update --yes --all && \
    /opt/conda/bin/conda config --add channels ioos --force  && \
    /opt/conda/bin/conda install --yes obvious-ci \
                                       conda-build \
                                       anaconda-client \
                                       jinja2 \
                                       setuptools

# Qt, matplotlib, and vispy.
RUN yum install -y libXext libSM libXrender fontconfig mesa-libGL

# octant.
RUN yum install -y gcc-gfortran

# udunits2.
RUN yum install -y expat-devel

# nco.
RUN yum install -y bison byacc flex gsl-devel antlr

ENV PATH /opt/conda/bin:$PATH
