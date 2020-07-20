FROM linuxserver/code-server

WORKDIR /root/

COPY enstale-ekstansyon-oss.sh /root/
COPY ekstansyon-oss.csv /root/
RUN chmod +x /root/enstale-ekstansyon-oss.sh
RUN /root/enstale-ekstansyon-oss.sh

COPY enstale-ekstansyon-ms.sh /root/
COPY ekstansyon-ms.csv /root/
RUN chmod +x /root/enstale-ekstansyon-ms.sh
RUN /root/enstale-ekstansyon-ms.sh

RUN cp -r /config/extensions /root/extensions
RUN rm -r /config/extensions

COPY demare.sh /root/
RUN chmod +x /root/demare.sh

EXPOSE 8080 8443
ENTRYPOINT ["/root/demare.sh"]
CMD ["/root/demare.sh"]
