FROM ruby:2.7-slim

WORKDIR /usr/src/app/

COPY src/ /usr/src/app/

EXPOSE 9080

CMD ["ruby", "test.rb", "9080"]