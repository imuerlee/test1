FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl unzip
RUN curl -L -s https://github.com/XTLS/Xray-core/releases/download/v1.8.16/Xray-linux-64.zip > x.zip
RUN unzip x.zip > /dev/null 2>&1
RUN mv xray net && chmod +x net
RUN rm -f x.zip

COPY run.sh .
COPY cfg.json .
RUN chmod +x run.sh

EXPOSE 8080

CMD ["/app/run.sh"]
