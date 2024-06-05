FROM mushr/hound:x86_64

RUN <<EOF
apt-get install -y liblcm-dev
pip install rospkg opencv-python vcstool empy==3.3.4 scikit-learn matplotlib pandas
rm -r ~/.catkin_tools
EOF

COPY catkin_ws /root/catkin_ws

RUN <<EOF
cd catkin_ws
catkin init
catkin config --extend /opt/ros/noetic
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS=-fdiagnostics-color
EOF
#cd src

#git clone https://github.com/antonilo/vision_locomotion
#mv vision_locomotion agile_locomotion

#git clone https://github.com/ethz-asl/catkin_boost_python_buildtool.git
#git clone https://github.com/catkin/catkin_simple.git
#git clone https://github.com/ethz-asl/eigen_catkin.git
#git clone https://github.com/ethz-asl/eigen_checks.git
#git clone https://github.com/ethz-asl/gflags_catkin.git
#git clone https://github.com/ethz-asl/glog_catkin.git
#git clone https://github.com/antonilo/rpq_quadrotor_common.git
#EOF

#RUN <<EOF
#cd catkin_ws/src/agile_locomotion/controller/launch
#cp cms_ros.launch blind_start.launch
#sed -i '$ d' blind_start.launch
#echo "    <node pkg=\"rostopic\" type=\"rostopic\" name=\"arbitrary_name\" args=\"pub /pkg_topic pkg_executable_file/message\" output=\"screen\"/>" >> blind_start.launch
#echo "</launch>" >> blind_start.launch
#chmod +x blind_start.launch
#EOF

RUN <<EOF
export Torch_DIR=/opt/conda/lib/python3.8/site-packages/torch/share/cmake/Torch
source ~/.bashrc
cd catkin_ws/src/agile_locomotion
catkin build agile_locomotion
EOF

RUN <<EOF

EOF
#alias blind_start=roslaunch agile_locomotion blind_start.launch

