#!/bin/bash
if [ -n "$AWS_REGION" ]
then
  aws s3 cp $SEQUENCER_YAML_S3_PATH /sequencer/this.yml --region $AWS_REGION
else
  aws s3 cp $SEQUENCER_YAML_S3_PATH /sequencer/this.yml
fi

sequencer /sequencer/this.yml