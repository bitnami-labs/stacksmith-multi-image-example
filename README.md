# Example of packaging application consisting of multiple tiers on Kubernetes with Stacksmith

This is an example documenting how to create a multi-tier application with Stacksmith and deploy it on Kubernetes.

# Images

The application consists of two images - UI and API. The first image is a single page HTML website, meant which for a real world application would be a single page application built using tools such as React & Redux and webpack. The second one provides an API that allows persisting data.

## UI

The UI part provides a static HTML website and forwards all requests with `/api` prefix to the API endpoint.

Instructions for packaging UI image can be found in [_README_](images/ui/README.md) in [images/ui/](images/ui/) directory.

## API

The API part is a simple application created using Ruby on Rails that exposes a simple API for listing and registering employees. It uses a MySQL database for persistence.

Instructions for packaging API image can be found in [_README_](images/api/README.md) in [images/api/](images/api/) directory.

# Packaging images

Please refer to README files for each tier for specific instructions on how to package it for Kubernetes using Stacksmith.

# Deploying helm chart for orchestrating deployment of all images

The `helm-charts/multi-image-app` directory contains the helm chart that can be used to deploy the entire multi-image solution.

## Deploying the dependent helm charts

In order to deploy the solution, download helm charts for all individual images into `helm-charts/multi-image-app/charts` directory - for example as:

- `helm-charts/multi-image-app/charts/multi-image-api-1.0.0-docker-123456789.tgz`
- `helm-charts/multi-image-app/charts/multi-image-ui-1.0.0-docker-123456789.tgz`

## Deploying the solution helm chart

Next, you can run the following command to deploy the solution:

```
$ helm install ./helm-charts/multi-image-app --name multi-image-test
```

In order to test the applicaiton, simply run port-forward to the UI service - such as by doing:

```
$ kubectl port-forward svc/multi-image-test-ui 8080:80
```

You can then access the application by going to [http://127.0.0.1:8080](http://127.0.0.1:8080).

## Updating helm chart with newer builds of UI and/or API images

In order to update the image, simply delete the existing helm chart in `helm-charts/multi-image-app/charts` directory and copy new helm chart there - such as:

- delete `helm-charts/multi-image-app/charts/multi-image-api-1.0.0-docker-123456789.tgz`
- delete `helm-charts/multi-image-app/charts/multi-image-ui-1.0.0-docker-123456789.tgz`
- copy newer API helm chart as `helm-charts/multi-image-app/charts/multi-image-api-1.0.1-docker-987654321.tgz`
- copy newer UI helm chart as `helm-charts/multi-image-app/charts/multi-image-ui-1.0.1-docker-987654321.tgz`

After that, simply doing a fresh `helm install` or `helm update` will upgrade one or more images, based on changes applied to the template.
