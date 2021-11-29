#!/bin/bash
set -e

# setup ros environment
source "/catkin_ws/devel/setup.bash"
sleep 30
roslaunch ur_robot_driver ur5e_bringup.launch robot_ip:=ursim
