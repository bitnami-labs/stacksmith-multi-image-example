# README

This is a sample application exposing `index.html` and `version.json` files using a web server.

It also proxies all requests with `/api` prefix to the API service.

# Packaging the application

## Prerequisites

In order to package the application, run the `create-archives` script the root directory of repository.

It will create `app-ui.zip` file in the `images/ui` directory.

It will also create `helm-charts-ui.tgz` file in the top-level repository directory.

A pre-built file can also be downloaded from [releases](../../../../releases) for the project.

## Package and deploy with Stacksmith

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com)
2. Go to project settings and choose Stack Templates
3. Scroll down to _Create a new stack template_ section
4. Enter `Generic application with API reference` as _Name_ field
5. Choose _Generic application (no pre-installed runtime)_ in _Based on:_ field
6. Click the <kbd>Create</kbd> button
7. Upload `helm-charts-ui.tgz` as _KUBERNETES_ template in _Targets_ section
8. Click the <kbd>Update</kbd> button
9. Create a new application and select the _Generic application with API reference_ stack template.
10. Specify `multi-image-ui` as the application name and `1.0.0` as application version
11. Select the Kubernetes target, deselecting any other targets
12. Upload the [app-ui.zip_](../../../../releases/download/v1.0.0/app-ui.zip) file (which can be found in [releases](../../../../releases) for the project.
13. Upload the [_build.sh_](stacksmith-scripts/build.sh) script from the [stacksmith-scripts/_](stacksmith-scripts/) folder.
14. Upload the [_boot.sh_](stacksmith-scripts/boot.sh) script from the [stacksmith-scripts/_](stacksmith-scripts/) folder.
15. Upload the [_run.sh_](stacksmith-scripts/run.sh) script from the [stacksmith-scripts/_](stacksmith-scripts/) folder.
16. Click the <kbd>Create</kbd> button.
