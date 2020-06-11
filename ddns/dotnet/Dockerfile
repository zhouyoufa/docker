FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

ARG BUILDPLATFORM
ARG TARGETPLATFORM

RUN git clone https://github.com/GameBelial/AliDDNSNet.git /source/app
WORKDIR /source/app

RUN RUNTIME="$(echo "$TARGETPLATFORM" | sed -e 's/\//\-/g' | sed -e 's/amd/\musl-x/g' | sed -e 's/-v7//g')" \
    && dotnet restore \
    && dotnet build \
    && dotnet publish -c Release -o out -r $RUNTIME

FROM zhouu/dotnet_runtime:3.1.4 AS runtime
WORKDIR /app

COPY --from=build /source/app/out ./
ENTRYPOINT ["/app/AliCloudDynamicDNS"]
