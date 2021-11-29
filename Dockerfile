FROM ros:melodic-ros-base

RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws

RUN apt-get install --no-install-recommends -y git

RUN git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver.git src/Universal_Robots_ROS_Driver

RUN git clone -b calibration_devel https://github.com/fmauch/universal_robot.git src/fmauch_universal_robot

RUN apt-get update -y && apt-get dist-upgrade -y
RUN rosdep update --rosdistro melodic
RUN rosdep install --from-paths src --ignore-src -y

RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make"

# setup entrypoint
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
