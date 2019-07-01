FROM jpiecuch96/infer-build-env-base:latest

ARG uid

ENV TZ "Europe/Warsaw"

# enable ssh
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

EXPOSE 22

RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd

# Create and configure vagrant user
RUN useradd --create-home -u $uid -s /bin/bash vagrant

# Configure SSH access
RUN mkdir -p /home/vagrant/.ssh
RUN cat /etc/insecure_key.pub >> /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant: /home/vagrant/.ssh
RUN echo -n 'vagrant:vagrant' | chpasswd

# Enable passwordless sudo for the "vagrant" user
RUN mkdir -p /etc/sudoers.d
RUN install -b -m 0440 /dev/null /etc/sudoers.d/vagrant
RUN echo 'vagrant ALL=NOPASSWD: ALL' >> /etc/sudoers.d/vagrant

# Some scripts in facebook-clang-plugins assume "python" is available
RUN cd /usr/local/bin && ln -s /usr/bin/python2.7 python

# Install opam 2
RUN curl -sL https://github.com/ocaml/opam/releases/download/2.0.3/opam-2.0.3-x86_64-linux > /usr/bin/opam && \
    chmod +x /usr/bin/opam

# Disable sandboxing
# Without this opam fails to compile OCaml for some reason. We don't need sandboxing inside a Docker container anyway.
RUN su - vagrant -c 'opam init --reinit --bare --disable-sandboxing --yes --auto-setup'

ADD ./build-functions.sh /home/vagrant/build-functions.sh
RUN echo '. ~/build-functions.sh' >> /home/vagrant/.bashrc

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
