Startup Instructions:

0. Run $xhost +local:docker. This will allow gazebo to launch in docker.
1. Clone this repo and cd into its root dir
2. Run docker compose up -d. Wait atleast a minute for gazebo and RVIZ to open. It may look like the compose is finished, but the code is building in the background.. If you run $ps -a, you should see build processes like cmake and colcon going on. Just wait 60 seconds for RVIZ and Gazebo to boot up.
3. Use RVIZ to provide a pose estimate for the robot
4. Use RVIZ to provide a goal pose to the robot
