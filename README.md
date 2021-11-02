<p align="center">
  <img height="100" src="https://raw.githubusercontent.com/pelias/design/master/logo/pelias_github/Github_markdown_hero.png">
</p>
<h3 align="center">A modular, open-source search engine for our world.</h3>
<p align="center">Pelias is a geocoder powered completely by open data, available freely to everyone.</p>
<p align="center">
<a href="https://github.com/pelias/libpostal-service/actions"><img src="https://github.com/pelias/libpostal-service/workflows/Continuous%20Integration/badge.svg" /></a>
<a href="https://en.wikipedia.org/wiki/MIT_License"><img src="https://img.shields.io/github/license/pelias/libpostal-service?style=flat&color=orange" /></a>
<a href="https://hub.docker.com/u/pelias"><img src="https://img.shields.io/docker/pulls/pelias/libpostal-service?style=flat&color=informational" /></a>
<a href="https://gitter.im/pelias/pelias"><img src="https://img.shields.io/gitter/room/pelias/pelias?style=flat&color=yellow" /></a>
</p>
<p align="center">
	<a href="https://github.com/pelias/docker">Local Installation</a> ·
        <a href="https://geocode.earth">Cloud Webservice</a> ·
	<a href="https://github.com/pelias/documentation">Documentation</a> ·
	<a href="https://gitter.im/pelias/pelias">Community Chat</a>
</p>
<details open>
<summary>What is Pelias?</summary>
<br />
Pelias is a search engine for places worldwide, powered by open data. It turns addresses and place names into geographic coordinates, and turns geographic coordinates into places and addresses. With Pelias, you’re able to turn your users’ place searches into actionable geodata and transform your geodata into real places.
<br /><br />
We think open data, open source, and open strategy win over proprietary solutions at any part of the stack and we want to ensure the services we offer are in line with that vision. We believe that an open geocoder improves over the long-term only if the community can incorporate truly representative local knowledge.
</details>

# Pelias Libpostal Service

This is a `Dockerfile` for creating an instance of the [whosonfirst/go-whosonfirst-libpostal](https://github.com/whosonfirst/go-whosonfirst-libpostal#wof-libpostal-server) server for use by Pelias. There's no actual code here.

The [libpostal_baseimage](https://github.com/pelias/libpostal_baseimage) `Dockerfile` is used to provide Libpostal code and data from the [openvenues/libpostal](https://github.com/openvenues/libpostal) repository.

To use the libpostal-service outside of Docker, see the [install instructions](https://github.com/whosonfirst/go-whosonfirst-libpostal#install) for the whosonfirst/go-whosonfirst-libpostal project.

## Example usage

Generally, this project is used automatically by the [pelias/docker](http://github.com/pelias/docker/) repository.

To run the Libpostal service manually, you can do something like the following:

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
