# Base image
FROM ubuntu:21.04

# Initialize
WORKDIR /app
RUN useradd user
RUN apt update && apt upgrade -y

# Setup timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt install -y tzdata python3-pip
RUN pip install https://github.com/inexio/snmpsim/archive/master.zip

# Clean up
RUN rm -rf /var/lib/apt/lists/*

# Add aliases
RUN echo "#!/bin/bash\n\/usr/local/bin/snmpsim-record-commands \"\$@\"" > /usr/local/bin/scanner && chmod a+x /usr/local/bin/scanner
RUN echo "#!/bin/bash\n\/usr/local/bin/snmpsim-command-responder --data-dir=/app --process-user=user --process-group=user \"\$@\"" > /usr/local/bin/simulator && chmod a+x /usr/local/bin/simulator

# Setup workdir and start script
RUN ["/bin/bash"]