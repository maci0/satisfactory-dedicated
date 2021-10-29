FROM cm2network/steamcmd:root
ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"



RUN mkdir ${HOMEDIR}/${STEAMAPP}-dedicated

copy entrypoint.sh /

RUN chmod +x "/entrypoint.sh" && chown -R "${USER}:${USER}" "${HOMEDIR}"
RUN chmod -R 775 ${HOMEDIR}
USER ${USER}
WORKDIR ${HOMEDIR}
CMD ["bash", "/entrypoint.sh"]
EXPOSE 15777/udp 15000/udp 7777/udp
