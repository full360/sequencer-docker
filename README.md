This repo contains the objects used to create the standard sequencer docker image. 

#### Container Build

To build this container... simply run:

```
$ make
```

#### Running the Container

Pass the following environment variables to the container at runtime:

* `SEQUENCER_YAML_S3_PATH` - s3:// path to the yaml configuration file. (see [full360/sequencer](https://github.com/full360/sequencer)) for more info.
* `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY` - AWS credentials. Note that the container will use an instance role if available, eliminating the need for these variables. The credentials/role must be able to access S3 and run ECS tasks.
* `AWS_REGION` - AWS region in which you are running the container.

#### MIT License

This software is released under the MIT license as provided in the repository.