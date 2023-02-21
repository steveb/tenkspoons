TenKSpoons
==========

Single threaded fake workload generator for the Ironic Bare Metal service.

This tool repeatedly creates and deploys a fake node, toggles the power state,
then undeploys and deletes. Metrics are exposed on port 8000 which can be viewed
in a browser and consumed by Prometheus.

Environment Variables
---------------------

- OS_CLOUD: valid key for openstacksdk clouds.yaml for a cloud containing a
  baremetal endpoint
- TENKSPOONS_NAME: base name of created nodes, defaults to `tenkspoons`

- TENKSPOONS_SUFFIX_LENGTH: length of random suffix to add to end of node name,
  defaults to `5`. If set to `0` and node `TENKSPOONS_NAME` already exists then
  actions will be performed on that node (apart from create and delete).

Running as a script
-------------------

Create a virtualenv and run the following:

```
pip install -r requirements.txt
export OS_CLOUD=mycloud
./tenkspoons
# Ctrl-c to exit, view metrics at http://localhost:8000/
```

Build a container
-----------------
```
buildah bud -t quay.io/steveb/tenkspoons:main-latest .
```

Running locally as a container
------------------------------

Container builds are up to date with the main branch

```
podman run --net=host -ti --rm --env OS_CLOUD=tenkspoons --volume ~/.config/openstack:/etc/openstack  quay.io/steveb/tenkspoons:main-latest
# Ctrl-c to exit, view metrics at http://localhost:8000/
```