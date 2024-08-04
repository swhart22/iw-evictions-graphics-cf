# Make updates and redeploy -- no dev

If changes have been made to the Google Doc that call for a republish, follow these steps: 

1. Navigate to the actions tab of this repo, to the action titled "Republish". [That is here](https://github.com/swhart22/iw-evictions-graphics-cf/actions/workflows/republish.yml).
2. Click the button that says "Run workflow." This fetches your new text from the google doc, rebuilds the project with the new text, and exports the build that we'll upload to Injustice Watch's Cloudflare repository.
<img width="1085" alt="Screenshot 2024-08-03 at 11 14 27 AM" src="https://github.com/user-attachments/assets/d675984d-df66-483e-a7c5-b730e914be24">
3. If the run is successful, you'll see a green circle here. If it's unsuccessful, contact me :)
<img width="423" alt="Screenshot 2024-08-03 at 1 47 02 PM" src="https://github.com/user-attachments/assets/27e71e94-a6ce-4482-b743-dddc909260fb">

4. You'll now see a zip folder at the root of this git repo called [evictions.zip](https://github.com/swhart22/iw-evictions-graphics-cf/blob/main/evictions.zip). Download and unzip it. You can download by clicking in the "..." at the right of the screen and selecting download from the menu there.
<img width="1131" alt="Screenshot 2024-08-03 at 1 49 56 PM" src="https://github.com/user-attachments/assets/3c84c9eb-a4dd-44b0-9152-e1e800cc2904">
5. The folder you just unzipped is a production-ready build of the updated project. You can add it to the Injustice Watch Interactives repository and push to publish it there. Just overwrite the previous "evictions" directory.



# Any dev changes

## Prerequisites

**[Node version 20+](https://nodejs.org/en/download/package-manager)** installed on your machine. If you have an older version of node already installed and want to keep it, I use NVM package manager to keep multiple versions at the same time. Install it [here](https://github.com/nvm-sh/nvm).

**[Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)**
Install by running

```
npm install --global yarn
```

## First time only
1. Clone this repo onto your machine.

```
git clone https://github.com/swhart22/iw-evictions-graphics-cf
```

2. Run yarn to install dependencies. Navigate into this project, then run yarn. Note that you should be using Node 20 here.

```
cd [path-to/where-you-cloned-this-repo]/iw-evictions-graphics-cf
```

```
yarn
```

## Commands

`yarn dev` starts a local server for development.

`yarn stage` builds the project and creates a build called "evictions" in the .svelte-kit directory at the root, which can overwrite the "evictions" directory in the Injustice Watch Interactives git repo to republish.

`yarn google` pulls text from the Google Doc. This may not work, as I'm using my Google config locally so for any text republishes, use the Github action above.

`yarn deploy` deploys the project to my personal cloudflare project. This also may not work without my personal credentials. If a dev change needs to republish, run yarn stage and overwrite the evictions folder in the Injustice Watch Interactives repository.

`yarn build` creates a static build of the project

`yarn preview` creates a build of the project and previews it on a local dev server




