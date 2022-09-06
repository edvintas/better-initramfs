FROM nvcr.io/nvidia/l4t-base:r32.5.0
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install curl gnupg2 make git nano binutils xz-utils cpio -y
COPY . /root
CMD make -C /root
