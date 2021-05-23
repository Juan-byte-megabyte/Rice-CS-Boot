#!/bin/bash
# Clean up temp directories
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*  
# Clear apt cache
apt clean -y
# Clear thumbnail cache for sysadmin, instructor, and student
sudo rm -rf /home/sysadmin/.cache/thumbnails
sudo rm -rf /home/instructor/.cache/thumbnails
sudo rm -rf /home/student/.cache/thumbnails
sudo rm -rf /root/.cache/thumbnails
