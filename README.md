# caffe-simple

Install Caffe deep learning framework on Ubuntu  Ubuntu 14.04.

Create a repository in which you put a Berksfile with the following line:

    cookbook 'caffe-simple', git: 'git://github.com/christopher5106/caffe-simple.git'

Create a stack on AWS Opsworks with your repository.

Create a custom layer and add the recipe 'caffe-simple' to the layer's recipes in the setup step.

Launch an instance.

You're done.
