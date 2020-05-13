FROM registry.access.redhat.com/ubi8/python-36

LABEL maintainer="Dmitry Misharov <dmisharo@redhat.com>"

LABEL io.k8s.description="Base image for Red Hat CCX Data Pipeline" \
      io.k8s.display-name="ccx-data-pipeline base image" \
      io.openshift.tags="builder,ccx-data-pipeline"

COPY ./s2i/bin/ /usr/libexec/s2i