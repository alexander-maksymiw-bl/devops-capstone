# Capstone

## Repository and CI/CD structure

- `master` branch
  - cannot be pushed to directly
  - feature branches can be merged in by PRs
  - runs the complete pipeline (linting, building, creating image, push image, update kubernetes cluster)
- `feature/` or `bugfix/` branches
  - used for building new features or bugfixes
  - only runs the building parts of the pipeline (linting, building)

## Docker registry

- images are uploaded to central `hub.docker.com`
- kubernetes cluster downloads images from there

## Kubernetes cluster

- designed for rolling deployments (via last pipeline step)
- running on Amazon EKS
- it is being created and first time deployed by eksctl (see `kubernetes/create_cluster.sh`)

## Angular documentation

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 9.1.0.

### Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

### Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

### Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

### Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

### Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

### Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
