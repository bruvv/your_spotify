# YourSpotify – Agent Guidelines

This repository is a **monorepo** containing:

* **Backend server**: `apps/server`
* **React frontend**: `apps/client`

Both are written in **TypeScript**.

The **server** polls the Spotify API and stores listening history in **MongoDB**, while the **client** presents graphs and statistics.

---

## **Setup**

### **Environment Variables**

To run the application, use the following keys as environment variables:

* `SPOTIFY_PUBLIC`
* `SPOTIFY_SECRET`

**Default Ports**:

* **API**: `8080`
* **Client**: `3000`

* Use `/apps/client/scripts/*` scripts to run and test the *client*
* Use `/apps/server/scripts/*` scripts to run and test the *server*

---

### **Install Dependencies**

From the root of the repo:

```
yarn install
```

> Yarn workspaces are enabled, so this will install packages for both server and client.

---

### **Development**

#### **Server**

```
https://github.com/bruvv/your_spotify/blob/master/apps/server/scripts/run/run_dev.sh
```

This launches **nodemon** on the TypeScript entry point.

#### **Client**

```
https://github.com/bruvv/your_spotify/blob/master/apps/client/scripts/run/run_dev.sh
```

The React app will serve on **[http://localhost:3000](http://localhost:3000)**.

### **Production Build**

```
yarn workspace @your_spotify/server build
yarn workspace @your_spotify/client build
```

---

## **Coding Conventions**

### **Server (`apps/server/src`)**

* Keep functions **small and focused**.
* Avoid **duplicating logic across controllers**.
* **Validate inputs with `zod`** for all new API endpoints.

### **Client (`apps/client/src`)**

* Use **React hooks** and **functional components**.
* Follow existing **component patterns**.
* When adding API endpoints, **update Redux slices or API calls**.

### **Environment Variables**

* **Never commit `.env` files or secrets**.
* `SPOTIFY_PUBLIC` and `SPOTIFY_SECRET` must be injected at runtime (Docker or local environment).

---

## **Working with the Database**

* The server uses **MongoDB** via **mongoose**.
* **Schema changes** → add a migration script in:

  ```
  apps/server/scripts/migrations.js
  ```
* For **importing past listening history**, use the `/import` endpoints described in the [upstream README](https://github.com/Yooooomi/your_spotify), **not direct DB writes**.

---

## **Pull Request Instructions**

* Use **descriptive commit messages** and link related issues.
* Run **all linting, type checks, and tests** locally before submitting.
* If your changes affect the API:

  * Update `apps/server/README.md`.
  * Adjust the client as necessary.
