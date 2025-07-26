Agent guidelines for YourSpotify
This repository is a monorepo containing a backend server (apps/server) and a
React frontend (apps/client). Both are written in TypeScript. The server
polls the Spotify API and stores listening history in MongoDB, while the
client presents graphs and statistics. To run the application you must
create a Spotify application and provide the SPOTIFY_PUBLIC and
SPOTIFY_SECRET keys as environment variables
github.com
.
By default the API listens on port 8080 and the client on port
3000
github.com
.

Setup
Install dependencies from the root of the repo using yarn install. Yarn
workspaces are enabled, so this will install packages for both the server
and client.

To develop the server, run
yarn workspace @your_spotify/server dev (or npm run dev within
apps/server). This launches nodemon on the TypeScript entry point.

To develop the client, run
yarn workspace @your_spotify/client start. The React application will
serve on port 3000 by default.

For a full stack environment, use docker-compose-dev.yml and run
docker-compose -f docker-compose-dev.yml up. This will start both
the API and client along with a MongoDB instance.

To build production assets, run
yarn workspace @your_spotify/server build and
yarn workspace @your_spotify/client build.

Testing and linting
The client defines a test script that uses react-scripts. To run the
test suite, execute yarn workspace @your_spotify/client test from the root.

Both server and client define lint scripts. Please run
yarn workspace @your_spotify/server lint and
yarn workspace @your_spotify/client lint before submitting changes.

Type checking can be performed with
yarn workspace @your_spotify/client typecheck and
yarn workspace @your_spotify/server build (which invokes the TypeScript
compiler).

Coding conventions
All server code lives under apps/server/src. Keep functions small and
focused, and avoid duplicating logic across controllers.

All client code lives under apps/client/src. Use React hooks and follow
existing component patterns. Prefer functional components over class
components.

When adding API endpoints, update both the server controller and the
client Redux slices or API calls. Ensure proper input validation using
zod on the server.

Do not commit .env files or any secrets. Environment variables
should be injected at runtime via Docker or your local environment. The
SPOTIFY_PUBLIC and SPOTIFY_SECRET values are especially sensitive
github.com
.

Working with the database
The server uses MongoDB via the mongoose ODM. Any schema changes
should be accompanied by a migration script in apps/server/scripts/migrations.js.

When importing past listening history, use the /import endpoints as
described in the upstream README
github.com
 rather than
writing directly to the database.

Pull request instructions
Include descriptive commit messages and link any related issues.

Run all linting, type checking and test suites locally before opening a PR.

If your changes affect the API, update apps/server/README.md accordingly
and, where appropriate, adjust the client.
