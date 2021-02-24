FROM --platform=$BUILDPLATFORM alpine:3.12

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

RUN apk --no-cache add ca-certificates git
COPY bin/$TARGETPLATFORM/trivy /usr/local/bin/trivy
COPY contrib/*.tpl contrib/
ENTRYPOINT ["trivy"]
