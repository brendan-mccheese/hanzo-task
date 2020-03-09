FROM cypress/base:8
WORKDIR /cypress_tests
ADD . .
RUN yarn install
ENTRYPOINT ["./entrypoint.sh"]
