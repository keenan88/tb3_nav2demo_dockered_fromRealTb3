#!/usr/bin/env bash


source /opt/ros/galactic/setup.bash
colcon build --packages-select turtlebot3_gazebo turtlebot3_navigation2
source install/setup.bash
gnome-terminal -- bash -c "ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py"

sleep 30s

gnome-terminal -- bash -c "ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py"

#gnome-terminal -- bash -c "source install/setup.bash; ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py; exec bash"
gnome-terminal -- bash -c "ros2 launch turtlebot3_navigation2 navigation2.launch.py ; exec bash"
bash # Prevents container from closing
