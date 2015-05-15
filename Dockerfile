FROM pelson/conda64_obvious_ci

MAINTAINER Filipe Fernandes <ocefpaf@gmail.com>

RUN yum -y update

# Conda patch and etc.
RUN yum install -y patch file

# Qt, matplotlib deps, vispy
RUN yum install -y libXext libSM libXrender fontconfig mesa-libGL

# Octant.
RUN yum install -y gcc-gfortran

# Udunits2
RUN yum install -y expat-devel

# Rasterio.
RUN yum install -y compat-expat1.i686

# nco.
RUN yum install -y bison byacc flex gsl-devel antlr

# Update miniconda.
RUN conda update --yes --all
RUN conda config --add channels ioos --force

# Add IOOS channel.
RUN conda config --add channels ioos -f

# Clean up.
RUN conda clean -y -t
