FROM klakegg/hugo as hugo

COPY ./ /hugodir

WORKDIR /hugodir
RUN hugo --config ./config.toml

#Copy static files to Nginx
FROM nginx:alpine
COPY --from=hugo /hugodir/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html