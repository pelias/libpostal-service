>This repository is part of the [Pelias](https://github.com/pelias/pelias)
>project. Pelias is an open-source, open-data geocoder originally sponsored by
>[Mapzen](https://www.mapzen.com/). Our official user documentation is
>[here](https://github.com/pelias/documentation).

# Pelias Libpostal Service

This is a `Dockerfile` for creating an instance of the [whosonfirst/go-whosonfirst-libpostal](https://github.com/whosonfirst/go-whosonfirst-libpostal#wof-libpostal-server) server for use by Pelias. There's no actual code here.

The [libpostal_baseimage](https://github.com/pelias/libpostal_baseimage) `Dockerfile` is used to provide Libpostal code and data from the [openvenues/libpostal](https://github.com/openvenues/libpostal) repository.

To use the libpostal-service outside of Docker, see the [install instructions](https://github.com/whosonfirst/go-whosonfirst-libpostal#install) for the whosonfirst/go-whosonfirst-libpostal project.

## Example usage

Generally, this project is used automatically by the [pelias/docker](http://github.com/pelias/docker/) repository.

To run the Libpostal service manually for advanced usage, you can do something like the following:

```
docker run -d -p 4400:4400 pelias/libpostal-service

# wait a few seconds for libpostal to come up

curl -s localhost:4400/parse?address=30+w+26th+st,+new+york,+ny | jq .
[
  {
    "label": "house_number",
    "value": "30"
  },
  {
    "label": "road",
    "value": "w 26th st"
  },
  {
    "label": "city",
    "value": "new york"
  },
  {
    "label": "state",
    "value": "ny"
  }
]
```
