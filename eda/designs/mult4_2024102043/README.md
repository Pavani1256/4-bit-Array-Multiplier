To Run the container in wsl use (in assignmrnt directory) :
docker run -it --name iic-osic-tools \
  -p 80:80 \
  -p 5901:5901 \
  -v "$HOME/DVD_Assignment_1/eda/designs:/foss/designs" \
  hpretl/iic-osic-tools:latest --wait --vnc
