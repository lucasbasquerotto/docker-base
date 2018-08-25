FROM alpine

ENV USER=myuser USER_ID=1000 USER_GID=1000

# now creating user
RUN apk add --no-cache bash && \
    addgroup -g "${USER_GID}" "${USER}" && \
    adduser \
      -u ${USER_ID} \
      -G ${USER} \
      -h /home/${USER} \
      -s /bin/bash \
      -D \
      ${USER}

COPY user-mapping.sh /
RUN  chmod u+x user-mapping.sh

ENTRYPOINT ["/user-mapping.sh"]
