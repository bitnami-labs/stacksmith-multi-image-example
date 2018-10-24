# README

This is a sample API application written using Ruby on Rails.

It exposes the following APIs:

- GET /api/version - retrieves version information
- GET /api/employees - lists employees in the database
- GET /api/employees/:id - retrieves a specific employees in the database
- POST /api/employees - creates an employee in the database

# Packaging the application

## Prerequisites

In order to package the application, run the `create-archives` script the root directory of repository.

It will create `app-api.zip` file in the `images/api` directory.

A pre-built file can also be downloaded from [releases](../../../../releases) for the project.

## Package and deploy with Stacksmith

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com)
2. Create a new application and select the _Generic application with DB (MySQL)_ stack template.
3. Specify `multi-image-api` as the application name and `1.0.0` as application version
4. Select the Kubernetes target, deselecting any other targets
5. Upload the [app-api.zip_](../../../../releases/download/v1.0.0/app-api.zip) file (which can be found in [releases](../../../../releases) for the project.
6. Upload the [_build.sh_](stacksmith-scripts/build.sh) script from the [stacksmith-scripts/_](stacksmith-scripts/) folder.
7. Upload the [_boot.sh_](stacksmith-scripts/boot.sh) script from the [stacksmith-scripts/_](stacksmith-scripts/) folder.
8. Upload the [_run.sh_](stacksmith-scripts/run.sh) script from the [stacksmith-scripts/_](stacksmith-scripts/) folder.
9. Click the <kbd>Create</kbd> button. 
