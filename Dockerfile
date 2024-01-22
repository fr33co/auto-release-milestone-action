FROM mcr.microsoft.com/dotnet/core/sdk:3.1

LABEL "com.github.actions.name"="Auto Release Milestone"
LABEL "com.github.actions.description"="Automatically create a release milestone"

LABEL version="0.1.0"
LABEL repository="https://github.com/fr33co/auto-release-milestone-action"
LABEL maintainer="Angel Guadarrama"

RUN apt update && apt install -y jq
RUN dotnet tool install -g GitReleaseManager.Tool

ENV PATH /root/.dotnet/tools:$PATH

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]