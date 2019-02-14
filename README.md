>This repository is part of the [Pelias](https://github.com/pelias/pelias)
>project. Pelias is an open-source, open-data geocoder originally sponsored by
>[Mapzen](https://www.mapzen.com/). Our official user documentation is
>[here](https://github.com/pelias/documentation).

# Pelias Libpostal Service

This is a `Dockerfile` for creating an instance of the [whosonfirst/go-whosonfirst-libpostal](https://github.com/whosonfirst/go-whosonfirst-libpostal#wof-libpostal-server) server for use by Pelias. There's no actual code here.

The [libpostal_baseimage](https://github.com/pelias/libpostal_baseimage) `Dockerfile` is used to provide Libpostal code and data from the [openvenues/libpostal](https://github.com/openvenues/libpostal) repository.

To use the libpostal-service outside of Docker, see the [install instructions](https://github.com/whosonfirst/go-whosonfirst-libpostal#install) for the whosonfirst/go-whosonfirst-libpostal project.
