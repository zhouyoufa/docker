FROM --platform=$BUILDPLATFORM alpine:3.11

ARG DOTNET_VERSION
ARG BUILDPLATFORM
ARG TARGETPLATFORM

ENV ASPNETCORE_URLS http://+:80 
ENV DOTNET_RUNNING_IN_CONTAINER true 
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT true

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates krb5-libs libgcc libintl libssl1.1 libstdc++ zlib \
    && rm -rf /var/cache/apk/*

RUN RUNTIME="$(echo "$TARGETPLATFORM" | sed -e 's/\//\-/g' | sed -e 's/amd/\musl-x/g' | sed -e 's/-v7//g')" \
    && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-$RUNTIME.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -oxzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz
