FROM achatap/java11_maven_jenkins

USER root

RUN apt-get update

RUN echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list.d/debian.list

RUN apt-get update

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update && apt-get install -y --no-install-recommends firefox

# Add a user for running applications.

RUN useradd apps

RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install x11vnc.
RUN apt-get install -y x11vnc

# Install xvfb.
RUN apt-get install -y xvfb

# Install fluxbox.
RUN apt-get install -y fluxbox

# Install wget.
RUN apt-get install -y wget

# Install wmctrl.
RUN apt-get install -y wmctrl

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
	
# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable
