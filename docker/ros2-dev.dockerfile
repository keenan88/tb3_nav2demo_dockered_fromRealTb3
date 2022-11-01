FROM osrf/ros:galactic-desktop

ENV DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update
RUN apt-get install --yes python3-pip \
                          curl \
                          ros-$ROS_DISTRO-gazebo-ros-pkgs \
                          ros-$ROS_DISTRO-navigation2 \
                          ros-$ROS_DISTRO-nav2-bringup \
                          ros-$ROS_DISTRO-turtlebot3* \
                          ros-$ROS_DISTRO-controller-manager \
                          ros-$ROS_DISTRO-joint-state-publisher-gui

RUN apt-get update && apt-get -y install \
    gstreamer1.0-tools \
    gstreamer1.0-libav \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-good1.0-dev \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-base

RUN apt-get update \
 && apt-get install -y gnome-terminal

# set nvidia varables
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# create workspace
RUN mkdir -p /ros2_ws/src
WORKDIR /ros2_ws

RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git \
&& cd turtlebot3_simulations && git checkout a1d03d3 && cd /ros2_ws

RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3.git \
&& cd turtlebot3 && git checkout bb4524c && cd /ros2_ws

ENV TURTLEBOT3_MODEL=waffle
#ENV GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS_DISTRO/share/turtlebot3_gazebo/models



ADD ./docker/start-demo.sh /start-demo.sh
RUN chmod +x /start-demo.sh
