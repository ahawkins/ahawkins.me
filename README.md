# ahawkins.xyz

Personal landing site for links to all things me

## Setup

Static HTML uploaded to S3 bucket with static website hosting enabled.
The bucket is used to create a cloudfront distrobution. Route53 set an
A record alias (Route53 specific extension) to the cloudfront
distrobution so S3 website can be on the TLD.

## Deploying

	make deploy
