# Github Publisher

Github's free web hosting makes it an ideal place to bootstrap static websites.
Uploading content to it, however, can be tedious.

Github Publisher streamlines content management by providing a docker image
that allows you to upload files to a github repository through simple HTTP
requests.

## Authentication

Authentication is determined from the `AUTH_*` environment variables.

For access token authentication (recommended), simply provide the authentication token:

`AUTH_TOKEN=mysecreteaccesstoken`

For password authentication, 

`AUTH_USER=username AUTH_PASS=password`

## Repository

Additionally, set the `REPO` environment variable to specify the repository
you wish to upload files to.

## API

Very simple:

```
PUT /path/to/url
Content
```

