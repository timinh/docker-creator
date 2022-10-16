FROM frolvlad/alpine-bash
COPY . /app
WORKDIR /app
RUN chmod +x ./bin/entrypoint.sh
ENTRYPOINT [ "bin/entrypoint.sh" ]
CMD ["help"]