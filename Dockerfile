FROM ubuntu:22.04

LABEL "com.github.actions.name"="Auto Release Milestone"
LABEL "com.github.actions.description"="Automatically create a release milestone"

LABEL version="0.1.0"
LABEL repository="https://github.com/fr33co/auto-release-milestone-action"
LABEL maintainer="Angel Guadarrama"

RUN apt update && apt install -y jq dotnet-sdk-8.0
RUN dotnet tool install --global GitReleaseManager.Tool

ENV PATH /root/.dotnet/tools:$PATH

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]