# k8s-cuelang

Testing CUE  (cuelang) with K8s manifests

## Project dependencies (MacOS)

Please keep in mind that this POC was written on a MacOS machine and is therefore untested on other OSes.

At a bare minimum, you need the `cue` binary.
If you want to run the tests you also needs `bats`, `kubeval` and `conftest`.
On MacOS:

```bash
    ❯ brew install cuelang/tap/cue
    ❯ brew install bats-core
    ❯ brew tap instrumenta/instrumenta
    ❯ brew install confest # Instrumenta tap
    ❯ brew install kubeval # Same thing
```

## CUE -> YAML

- Based on the CUE Kubernetes tutorial
- One `kube.cue` per domain directory to fill the namespace of K8s resources
  - See `backend/kube.cue`
- One `kube.cue` per microservice directory to describe its configuration
  - See `backend/{awesome-service,cool-service}/kube.cue`

### Evaluating the CUE files to generate YAML manifests

You can dump the service configuration by using the `cue_dump.sh` script.
Examples:

```bash
    ❯ bash cue_dump.sh backend cool-service # For cool-service
    ❯ bash cue_dump.sh backend awesome-service # For awesome-service
```

## Running the tests

Take a look at the tests to see how to integrate unit tests and policy validation.

Run the tests with the `tests.sh` script.

```bash
    ❯ bash tests.sh
```