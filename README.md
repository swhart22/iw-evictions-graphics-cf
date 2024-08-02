# Prerequisites

**[Node version 20+](https://nodejs.org/en/download/package-manager)** installed on your machine. If you have an older version of node already installed and want to keep it, I use NVM package manager to keep multiple versions at the same time. Install it [here](https://github.com/nvm-sh/nvm).

**[Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)**
Install by running

```
npm install --global yarn
```

# Make updates and redeploy.

## First time only
1. Clone this repo onto your machine.

```
git clone https://github.com/swhart22/iw-evictions-graphics-cf
```

2. Run yarn to install dependencies. Navigate into this project, then run yarn.

```
cd [path-to/where-you-cloned-this-repo]/iw-evictions-graphics-cf
```

```
yarn
```

## For each update

3. Get text updates from our Google Doc. Assuming you've navigated into the project,

```
yarn google
```
