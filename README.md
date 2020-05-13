# Creating a basic S2I builder image  

## Getting started  

### Files and Directories

| File             | Required? | Description                                 |
| ---------------- | --------- | ------------------------------------------- |
| Dockerfile       | Yes       | Defines the base builder image              |
| s2i/bin/assemble | Yes       | Script that builds the application          |
| s2i/bin/usage    | No        | Script that prints the usage of the builder |
| s2i/bin/run      | Yes       | Script that runs the application            |

#### Dockerfile

Create a *Dockerfile* that installs all of the necessary tools and libraries that are needed to build and run our application.  This file will also handle copying the s2i scripts into the created image.

#### S2I scripts

##### assemble

Create an *assemble* script that will build our application, e.g.:

- build python modules
- bundle install ruby gems
- setup application specific configuration

The script can also specify a way to restore any saved artifacts from the previous image.

##### run

Create a *run* script that will start the application.

##### save-artifacts (optional)

Create a *save-artifacts* script which allows a new build to reuse content from a previous version of the application image.

##### usage (optional)

Create a *usage* script that will print out instructions on how to use the image.

##### Make the scripts executable

Make sure that all of the scripts are executable by running *chmod +x s2i/bin/**

#### Using the saved artifacts script

Rebuilding the application using the saved artifacts can be accomplished using the following command:

```shell
s2i build --incremental=true test/test-app nginx-centos7 nginx-app
---> Restoring build artifacts...
---> Building and installing application from source...
```

This will run the *save-artifacts* script which includes the custom code to backup the currently running application source, rebuild the application image, and then re-deploy the previously saved source using the *assemble* script.
