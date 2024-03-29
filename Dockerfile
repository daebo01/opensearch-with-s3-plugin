FROM opensearchproject/opensearch:2.11.1

RUN /usr/share/opensearch/bin/opensearch-plugin install --batch repository-s3

ADD dumb-init .
ADD initializeKeystore.sh .

CMD ["./initializeKeystore.sh"]