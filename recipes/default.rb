bash "install-caffe" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
  apt-get update
  apt-get -y install git
  apt-get -y install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
  apt-get -y install --no-install-recommends libboost-all-dev
  apt-get -y install libgflags-dev libgoogle-glog-dev liblmdb-dev
  apt-get -y install libatlas-base-dev
  apt-get -y install python-dev
  apt-get -y install awscli
  apt-get -y install python-pip
  git clone https://github.com/BVLC/caffe.git
  cd caffe
  cd python
  for req in $(cat requirements.txt); do pip install $req; done
  EOH
end

template "/home/ubuntu/caffe/Makefile.config" do
  source "Makefile.config.erb"
  mode "0644"
  owner "root"
  group "root"
end

bash "compile-caffe" do
  user "root"
  cwd "/home/ubuntu/caffe"
  code <<-EOH
  make all --jobs=8
  make test
  make runtest
  make pycaffe
  EOH
end
