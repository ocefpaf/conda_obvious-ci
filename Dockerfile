FROM pelson/conda64_obvious_ci

MAINTAINER Filipe Fernandes <ocefpaf@gmail.com>

RUN yum -y update

# conda patch and etc.
RUN yum install -y patch file

# Qt, matplotlib deps, vispy
RUN yum install -y libXext libSM libXrender fontconfig mesa-libGL

# octant.
RUN yum install -y gcc-gfortran

# Udunits2
RUN yum install -y expat-devel

# rasterio.
RUN yum install -y compat-expat1.i686

# ecmwf_grib.
RUN yum install -y openjpeg-devel

# nco.
RUN yum install -y bison byacc flex gsl-devel antlr

# Update miniconda.
RUN conda update --yes --all

# Add IOOS channel.
RUN conda config --add channels ioos --force

# Clean it up.
RUN conda clean -y -t
