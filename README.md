# pslive

Public livestreaming and real-time interactivity for Planktoscopes

## Usage

The binaries generated by this project are entirely self-contained, except for the other services which pslive needs to talk to. You can simply run the pslive binary from anywhere, though you'll need to set some environment variables to specify how pslive should talk to the services it depends on.

### Development

To install various backend development tools, run `make install`.

Before you start the server for the first time, you'll need to generate the webapp build artifacts by running `make buildweb` (which requires you to have first installed [Yarn Classic](https://classic.yarnpkg.com/lang/en/)). Then you can start the server using golang's `go run` by setting some environment variables and running `make run`. You will need to have installed golang first. Any time you modify the webapp files (in the web/app directory), you'll need to run `make buildweb` again to rebuild the bundled CSS and JS. Whenever you use a CSS selector in a template file (in the web/templates directory), you should *also* run `make buildweb`, because the build process for the bundled CSS omits any selectors not used by the templates.

If you want to develop on the Rego policies (for authorization & access control), you can regenerate policies from Go templates with `make generate`, autoformat Rego policy files (as well as Go files) with `make fmt`, and run linter checks on Rego policy files (as well as Go files) with `make lint`.

### Building

To execute the full build pipeline, run `make`; to build the docker images, run `make build`. You will need to have installed golang and golangci-lint first; `make build` *should* automatically install golangci-lint, but this might not work; if not, you'll need to install it manually. Note that `make build` will also automatically regenerate the webapp build artifacts. The resulting built binaries can be found in directories within the dist directory corresponding to OS and CPU architecture (e.g. `./dist/pslive_window_amd64/pslive.exe` or `./dist/pslive_linux_amd64/pslive`)

### External Services

You'll need to [set up](https://console.ory.sh/registration) an Ory Cloud project and provision a personal access token so that pslive can access the Ory Kratos administrative API for your Ory Cloud project. You should enable user registration and password authentication on this project. You should also use the identity schema listed in the `apischemas/v1.1/person.schema.json` file in this repository for your Ory Cloud identity schema.

### Environment Variables

You'll need to set some environment variables to tell pslive how to assign names and how to connect to a ZeroTier network controller. Specifically, you'll need to set:

- DATABASE_URI, which should be the URI for a sqlite database file to use/create (e.g. `file:db.sqlite3`). Note that the parent directory of that file needs to be writable, as SQLITE also creates a write-ahead log file and a shared memory file in the same directory.
- SESSIONS_COOKIE_NOHTTPSONLY, which should be `true` if you are running pslive locally (as `localhost`) without HTTPS. If you are running pslive over the web, you should run it behind an HTTPS reverse proxy and you should leave SESSION_COOKIE_NOHTTPSONLY unset.
- SESSIONS_AUTH_KEY, which should be set to a session authentication key generated by running pslive without the SESSION_AUTH_KEY set.
- SESSIONS_ENCRYPTION_KEY, which should be set to a session encryption key generated by running pslive without the SESSION_ENCRYPTION_KEY set.
- ORY_KRATOS_SERVER, which should be set to the URL of your Ory Kratos public API (either self-hosted or hosted on Ory Cloud), including the protocol scheme (e.g. `https://project-id.projects.oryapis.com`).
- ORY_ACCESS_TOKEN, which should be set to a personal access token from Ory Cloud for the URL of your Ory Kratos administrative API.
- TURBOSTREAMS_HASH_KEY, which should be set to an HMAC key generated by running Fluitans without the TURBOSTREAMS_HASH_KEY set.

For example, you could generate the session and Turbo Streams hash key using:
```
make run
```
which will print a message like:
```
Record this key for future use as SESSIONS_AUTH_KEY: QVG4y5EPPoDZjAzYc6j7I09iJum3w+hXNrB3O4HQvSc=
Record this key for future use as SESSIONS_ENCRYPTION_KEY: Z/47Z2Uf6J68VFf7uAjiTfmum3yKWRuR2KoLVhwVdYA=
Record this key for future use as TURBOSTREAMS_HASH_KEY: S+daMZsQxsqjmINunGWJhXvvxcgJtqnACba+sFuC4Tc=
```

And then you could run the server in development mode using:
```
DATABASE_URI='file:db.sqlite3' \
SESSION_AUTH_KEY='QVG4y5EPPoDZjAzYc6j7I09iJum3w+hXNrB3O4HQvSc=' \
SESSIONS_ENCRYPTION_KEY='Z/47Z2Uf6J68VFf7uAjiTfmum3yKWRuR2KoLVhwVdYA=' \
ORY_KRATOS_SERVER='https://project-1234.projects.oryapis.com' \
ORY_ACCESS_TOKEN='ory_pat_12345' \
TURBOSTREAMS_HASH_KEY='S+daMZsQxsqjmINunGWJhXvvxcgJtqnACba+sFuC4Tc=' \
make run
```

Or you could run the built binary using:
```
DATABASE_URI='file:db.sqlite3' \
SESSION_AUTH_KEY='QVG4y5EPPoDZjAzYc6j7I09iJum3w+hXNrB3O4HQvSc=' \
ORY_KRATOS_SERVER='https://project-1234.projects.oryapis.com' \
ORY_ACCESS_TOKEN='ory_pat_12345' \
TURBOSTREAMS_HASH_KEY='S+daMZsQxsqjmINunGWJhXvvxcgJtqnACba+sFuC4Tc=' \
./pslive
```

## License

Copyright Prakash Lab and the Sargassum project contributors.

SPDX-License-Identifier: Apache-2.0 OR BlueOak-1.0.0

You can use this project either under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0) or under the [Blue Oak Model License 1.0.0](https://blueoakcouncil.org/license/1.0.0); you get to decide. We chose the Apache license because it's OSI-approved, and because it goes well together with the [Solderpad Hardware License](http://solderpad.org/licenses/SHL-2.1/), which is a license for open hardware used in other related projects but not this project. We prefer the Blue Oak Model License because it's easier to read and understand.
